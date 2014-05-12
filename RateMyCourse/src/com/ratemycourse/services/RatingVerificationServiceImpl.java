package com.ratemycourse.services;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

//CouchDB Imports
import org.lightcouch.CouchDbClient;
import org.lightcouch.NoDocumentException;

import com.google.gson.JsonObject;


public class RatingVerificationServiceImpl implements RatingVerification {

	//	@Autowired
	//	private CouchDbClient dbClient;
	static CouchDbClient dbClient = new CouchDbClient("couchdb.properties");

	/* (non-Javadoc)
	 * @see com.ratemycourse.services.UserService#verifyAndUpdateRating(java.lang.String)
	 */
	@Override
	public String verifyAndUpdateRating(final String key) {
		String result = null;
		JsonObject doc01Course = null;
		JsonObject doc02RatingAndComments = verifyConfirmation(key);
		if ( doc02RatingAndComments != null) {
			String cId = doc02RatingAndComments.get("c_id").getAsString();
			doc01Course = getUpdatedCourseDoc(doc02RatingAndComments, cId);
			String rev = doc01Course.get("_rev").getAsString();
			doc01Course.addProperty("_rev", rev);
			try {
				dbClient.update(doc01Course);
			} catch (org.lightcouch.DocumentConflictException e) {
				resolveConflict(doc02RatingAndComments, cId);
				e.printStackTrace();
			}
			result = "Thanks for confirmation!";
		} else {
			result = "Invalid link";
		}
		return result;
	}

	/**
	 * To handle document update conflict (409 error) when more than one user tries to update single doc.
	 * @param doc02RatingAndComments - user rating document
	 * @param cId - course id.
	 */
	private void resolveConflict(JsonObject doc02RatingAndComments, String cId) {
		try {
			JsonObject doc01Course = getUpdatedCourseDoc(doc02RatingAndComments, cId);
			String rev = doc01Course.get("_rev").getAsString();
			doc01Course.addProperty("_rev", rev);
			dbClient.update(doc01Course);
		} catch (org.lightcouch.DocumentConflictException e) {
			resolveConflict(doc02RatingAndComments, cId);
			e.printStackTrace();
		}
	}

	/**
	 * To calculate the overall course rating and other doc01 related attributes. 
	 * @param doc02RatingAndComments - user rating document
	 * @param cId - course id.
	 * @return updated doc01
	 */
	private JsonObject getUpdatedCourseDoc(JsonObject doc02RatingAndComments, String cId) {
		int overallCount = 0, userTypeCount;
		double overallRating, userRating, oldUserRating;
		String userType = null;
		JsonObject doc01Course = null;

		try {
			userType = doc02RatingAndComments.get("type").getAsString();
			doc01Course = dbClient.find(JsonObject.class, cId);
			overallRating = doc01Course.get("overall_rating").getAsDouble();
			overallCount = doc01Course.get("overall_count").getAsInt();
			userRating = doc02RatingAndComments.get("user_rating").getAsDouble();
			if ("IND".equals(userType)) {
				userTypeCount = doc01Course.get("ind_user_count").getAsInt();
				doc01Course.addProperty("ind_user_count", ++userTypeCount);
				oldUserRating = doc01Course.get("ind_user_rating").getAsInt();
				doc01Course.addProperty("ind_user_rating", oldUserRating <= 0 ? userRating : (oldUserRating + userRating) / 2 );
			} else if ("EST".equals(userType)) {
				userTypeCount = doc01Course.get("est_user_count").getAsInt();
				doc01Course.addProperty("est_user_count", ++userTypeCount);
				oldUserRating = doc01Course.get("est_user_rating").getAsInt();
				doc01Course.addProperty("est_user_rating", oldUserRating <= 0 ? userRating : (oldUserRating + userRating) / 2 );
			} else if ("UEST".equals(userType)) {
				userTypeCount = doc01Course.get("uest_user_count").getAsInt();
				doc01Course.addProperty("uest_user_count", ++userTypeCount);
				oldUserRating = doc01Course.get("uest_user_rating").getAsInt();
				doc01Course.addProperty("uest_user_rating", oldUserRating <= 0 ? userRating : (oldUserRating + userRating) / 2 );
			}
			overallRating = overallRating <= 0 ? userRating : (overallRating + userRating) / 2 ;
			doc01Course.addProperty("overall_rating", overallRating);
			doc01Course.addProperty("overall_count", overallCount + 1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doc01Course;
	}

	/**
	 * To verify if the confirmation link is valid or not.
	 * @param key UniqueKey
	 * @return doc02-rating-and-comments document, if the link is valid; null, otherwise.
	 */
	private JsonObject verifyConfirmation(String key) {
		JsonObject doc02RatingAndComment = null;
		try {
			/*			DesignDocument designDoc = dbClient.design().getFromDb("_design/views");//dd name ie._design/view name
			Response response;
			response = dbClient.design().synchronizeWithDb(designDoc);//dunno wt this shit is doing
			 */
			//access view[unique_key,doc] to get the doc_02;
			//if doc's _id is used as unique key, then no need to use by_unique_verif_key view.
			List<JsonObject> ratingAndComments = dbClient.view("views/by_unique_verif_key").key(key).query(JsonObject.class);
			for (JsonObject doc02 : ratingAndComments) {
				doc02RatingAndComment  = (JsonObject)doc02.get("value");
				if (!doc02RatingAndComment.get("is_verified").getAsBoolean()) {
					doc02RatingAndComment.addProperty("is_verified", true);
					doc02.addProperty("_rev", doc02RatingAndComment.get("_rev").getAsString());
					dbClient.update(doc02RatingAndComment);
				} else {
					doc02RatingAndComment = null;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doc02RatingAndComment;
	}
	/**
	 * Check and do email validation if required.
	 * @param email
	 * @return  unique key - if the user is rating for the first time;
	 * 			0		   - if policy is defined as not to ask for email verification for all; or if user is already validated.
	 * 			-1		   - if email verification is required and but failed to send email;
	 */
	public static long sendemail(String email) {
		long uniqueKey = 0;
		System.out.println(email);
		boolean emailRequiredNow = true;
		final Properties prop = new Properties();
		InputStream input = null;

		emailRequiredNow = emailRequired(email, prop);
		System.out.println(emailRequiredNow);
		if (emailRequiredNow) {
			try {
				input = RatingVerificationServiceImpl.class.getResourceAsStream("mail.properties");
				if(input == null){
					System.out.println("unable to find properties");
					uniqueKey = -1;
				} else {
					prop.load(input);
				}
				Session session = Session.getDefaultInstance(prop,
						new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						String sendFromEmail = prop.getProperty("send_from");
						String code = prop.getProperty("code");
						return new PasswordAuthentication(sendFromEmail, code);
					}
				});

				uniqueKey = (long) (1000000000000L + Math.random()*10000000000000L);
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress(prop.getProperty("send_from")));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
				message.setSubject(prop.getProperty("mail_subject"));
				message.setText(prop.getProperty("base_URL") +uniqueKey);
				//message.setText("Hi Admin" + email);
				//message.setText("</a>");
				Transport.send(message);
				System.out.println("mail sent");
			} catch (SendFailedException ex) {
				uniqueKey = -1;
				ex.printStackTrace();
			} catch (MessagingException e) {
				uniqueKey = -1;
				throw new RuntimeException(e);
			} catch (IOException ioEx) {
				uniqueKey = -1;
				ioEx.printStackTrace();
			} finally {
				if ( input != null){
					try {
						input.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		System.out.println("key:"+uniqueKey);
		return uniqueKey;
	}

	/**
	 * Check if verification is required or not based on the policy and other factors.
	 * @param email
	 * @param prop
	 */
	private static boolean emailRequired(final String email, Properties prop) {
		boolean emailRequiredEverytime = false;
		boolean emailRequiredNow = true;
		List<JsonObject> users;
		InputStream input = null;
		try {
			input = RatingVerificationServiceImpl.class.getResourceAsStream("policy.properties");
			if(input == null){
				System.out.println("unable to find properties");
				emailRequiredNow = true;
			} else {
				prop.load(input);
				System.out.println(prop.getProperty("email_verif_required_everytime"));
				emailRequiredEverytime = "Yes".equals(prop.getProperty("email_verif_required_everytime")) ? true : false;
			}
			if (!emailRequiredEverytime) {
				//check if user is already validated or not.
				//http://localhost:5984/demo/_design/views/_view/get_validated_users?key=%22simritha@gmail.coms%22
				users = dbClient.view("views/get_validated_users")
						.key(email.trim())
						.query(JsonObject.class);
				System.out.println("users:"+users.toString());
				emailRequiredNow = users.isEmpty();
			}
		} catch (NoDocumentException noDocEx) {
			noDocEx.printStackTrace();
		}  catch (IOException ioEx) {
			ioEx.printStackTrace();
		} finally {
			if ( input != null){
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return emailRequiredNow;
	}
}

