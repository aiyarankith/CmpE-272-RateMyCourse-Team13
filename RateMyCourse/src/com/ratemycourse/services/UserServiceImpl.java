package com.ratemycourse.services;

import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.sql.DataSource;




//CouchDB Imports
import org.lightcouch.CouchDbClient;
import org.lightcouch.DocumentConflictException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.google.gson.JsonObject;
import com.ratemycourse.model.Comment;
import com.ratemycourse.model.Course;
import com.ratemycourse.model.Rss;
import com.ratemycourse.model.User;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;


public class UserServiceImpl implements UserService {


	@Autowired
	DataSource dataSource;

	//	@Autowired
	//	private CouchDbClient dbClient;
	CouchDbClient dbClient = new CouchDbClient("couchdb.properties");

	@Override
	public void insertData(User user) {

		String sql = "INSERT INTO user "
				+ "(first_name,last_name, email, password, state) VALUES (?, ?, ?,?,?)";

		System.out.println("Values : "+user.getLastName());

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(
				sql,
				new Object[] {user.getFirstName(), user.getLastName(),
						user.getEmail(), user.getPassword(),user.getState() });


	}
	@Override
	public String fetchData(User user) {
		String email=user.getEmail();
		String password=user.getPassword();

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		String username="";
		String pass="";	 
		String f_name="";

		String sql = "select email, password, first_name from user where email = '"+email+"' and password='"+password+"'";
		List results=jdbcTemplate.queryForList(sql);
		for (Object result : results) {
			System.out.println(result);
			HashMap map = (HashMap) result;

			/*Map <String,Object> results = 
			        JdbcTemplate.queryForMap(
			        "SELECT email, password FROM user WHERE email = ? AND password = ? "
			        ,user.getEmail(), user.getPassword());*/

			/*email=(String)result.get("email");
	          password=(String)result.get("password");*/
			System.out.println("Email " +email);
			System.out.println ("password " +password);
			for (Object key : map.keySet()) {
				map.get(1);


				if(key.equals("email")){
					username=(String)map.get(key);
				}
				else if (key.equals("password")){
					pass=(String)map.get(key);
				}
				else if (key.equals("first_name")){
				f_name = (String)map.get(key);
				}
				System.out.print(key + " = " + map.get(key) + "; ");
				System.out.println ("first  " +f_name);
			}
		}



		if((email.equals(username)) && (password.equals(pass))){
			System.out.println("Apply Login");
			return f_name;
		} else {


			System.out.println("Do not apply login");
			 return "Invalid Login";
		}
	}

	@Override
	public List<String> RSSList() {
		List RSSList = new ArrayList();

		List<String> items = new ArrayList<String>();

		Rss content  = new Rss();
		try {
			URL url  = new URL("http://sfbay.craigslist.org/cpg/index.rss");
			XmlReader reader = null;
			reader = new XmlReader(url);
			SyndFeed feed = new SyndFeedInput().build(reader);
			System.out.println("Feed Title: "+ feed.getAuthor());

			// content.setAuthor(feed.getAuthor());
			//items.add(content.getAuthor());

			for (Iterator i = feed.getEntries().iterator(); i.hasNext();) {
				SyndEntry entry = (SyndEntry) i.next();

				content.setTitle(entry.getTitle());
				content.setDate((entry.getPublishedDate()).toString());
				content.setDescription((entry.getUri()));
				items.add(content.getTitle());
				//items.add(content.getDate());
				items.add(content.getDescription());


				//System.out.println("Title::: "+content.getTitle());

			}

		} catch (Exception e){
			e.printStackTrace();
		}

		System.out.println("USerService::: "+items);

		return items;
	}

	@Override
	public String insertCourse(Course details) {

		//.setHost("aiyarankith.cloudbees.cloudant.com")
		//.setUsername("aiyarankith.cloudbees")
		//.setPassword("bs5854fh4I3nnGYJQ5e58FML");

		Map<String, Object> map = new HashMap<>();
		map.put("_id", (details.getc_id()).toLowerCase());

		map.put("docfield", details);
		System.out.println("Find Result");
		String result ="Course Entered Successfully";

		try {
			dbClient.save(map);


		} catch (DocumentConflictException e){

			e.printStackTrace();
			result = "Course Already Exists";
		}
		return result;

	}

	@Override
	public JsonObject getCourse(String cId) {

		JsonObject json = null;
		try {
			json = dbClient.find(JsonObject.class, cId);
			System.out.println("JSON at GET:: "+json);

		} catch (Exception e){

			e.printStackTrace();
		}
		return json; 		

	}


	@Override
	public List<JsonObject> getCourseComments(String cId) {
		System.out.println("Get Ratings for::: "+cId);
		List<JsonObject> commentList = null;
		try {
			/*
			 * CouchDB query for Retrieving Comments
			 * http://127.0.0.1:5984/demo/_design/views/_view/by_comments?key="cmpe271"
			 */
			commentList = dbClient.view("views/by_comments")
					.key(cId)
					.descending(true)
					.query(JsonObject.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Get Ratings::: "+commentList);
		return commentList;		

	}
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
			//to do later- cron job to delete unauth docs after certain period.
		}
		return result;
	}

	/**
	 * To handle document update conflict (409 error).
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

	/* (non-Javadoc)
	 * @see com.ratemycourse.services.UserService#saveRating(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public String saveRating(String userName, String email, String userType,
			String userRating, String comment) {
		String message = null;
		JsonObject doc02RatingAndComments = new JsonObject();
		doc02RatingAndComments.addProperty("unique_key", getUniqueKey());
		//set uniquekey
		//set all other attributes
		try {
			dbClient.save(doc02RatingAndComments);
		} catch (DocumentConflictException e) {
			e.printStackTrace();
		}
		return message;
	}
	/**
	 * Generate unique key to be sent to user and verify upon confirmation. 
	 * @return UniqueKey
	 */
	private String getUniqueKey() {
		return null;
	}

	/* (non-Javadoc)
	 * @see com.ratemycourse.services.UserService#getTopNRtdCourse(int)
	 */
	@Override
	public List<JsonObject> getNTopRtdCourse(int count) {
		List<JsonObject> courseList = null;
		try {
			/*
			 * Corresponding sample CouchDB query
			 * http://127.0.0.1:5984/monish/_design/views/_view/by_top_rated?descending=true&limit=10
			 */
			courseList = dbClient.view("views/by_top_rated")
					.descending(true)
					.limit(count)

					.query(JsonObject.class);
			if (courseList.isEmpty()) {
				JsonObject error = new JsonObject();
				error.addProperty("error_type", "data_missing");
				error.addProperty("error_message", "Course data missing");
				courseList.add(error);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courseList;
	}



	/* (non-Javadoc)
	 * @see com.ratemycourse.services.UserService#getIndOrientedCourse(int)
	 */
	@Override
	public List<JsonObject> getIndOrientedCourse(int count) {
		List<JsonObject> courseList = null;
		try {
			/*
			 * Corresponding sample CouchDB query
			 * http://127.0.0.1:5984/demo/_design/views/_view/by_top_ind_user_rated?descending=true&limit=10
			 */
			courseList = dbClient.view("views/by_top_ind_user_rated")
					.descending(true)
					.limit(count)
					.query(JsonObject.class);
			if (courseList.isEmpty()) {
				JsonObject error = new JsonObject();
				error.addProperty("error_type", "data_missing");
				error.addProperty("error_message", "Course data missing");
				courseList.add(error);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courseList;
	}


	/* (non-Javadoc)
	 * @see com.ratemycourse.services.UserService#getMostFollowedCourse(int)
	 */
	@Override
	public List<JsonObject> getMostFollowedCourse(int count) {
		List<JsonObject> courseList = null;
		try {
			/*
			 * Corresponding sample CouchDB query
			 * http://127.0.0.1:5984/demo/_design/views/_view/by_most_no_of_comments?descending=true&limit=10
			 */
			courseList = dbClient.view("views/by_most_no_of_comments")
					.descending(true)
					.limit(count)
					.query(JsonObject.class);
			if (courseList.isEmpty()) {
				JsonObject error = new JsonObject();
				error.addProperty("error_type", "data_missing");
				error.addProperty("error_message", "Course data missing");
				courseList.add(error);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courseList;
	}

	@Override
	public String insertcomment(Comment comment_detail) {

		//Calculate the date
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date dates = new Date();
		String date = dateFormat.format(dates);
			
		//Calculate Average
		float total_ratings = (Float.valueOf(comment_detail.getcontent_rating()) + Float.valueOf(comment_detail.gettechnology_rating()) + Float.valueOf(comment_detail.getoverall_rating()))/15;
		System.out.println("course ID:" +total_ratings);

		String message = null;
		JsonObject doc_RatingAndComments = new JsonObject();
		doc_RatingAndComments.addProperty("unique_key", "add email comf id here");
		doc_RatingAndComments.addProperty("is_verified", "false");
		doc_RatingAndComments.addProperty("type", comment_detail.gettype_of_user());
		doc_RatingAndComments.addProperty("user_rating", total_ratings);
		doc_RatingAndComments.addProperty("comment", comment_detail.getcomment());
		doc_RatingAndComments.addProperty("c_id", comment_detail.getcourse_id());
		doc_RatingAndComments.addProperty("c_name", comment_detail.getcourse_name());
		doc_RatingAndComments.addProperty("user_name", comment_detail.getcommenter_name());
		doc_RatingAndComments.addProperty("email", comment_detail.getcommenter_email());
		doc_RatingAndComments.addProperty("date", date);
		
		System.out.println("Complete :"+doc_RatingAndComments);

		try {
			dbClient.save(doc_RatingAndComments);
			message = "Comment Added! Please verify your email id in order to confirm comments";
			UserServiceImpl.sendemail(comment_detail.getcommenter_email());
		} catch (DocumentConflictException e) {
			e.printStackTrace();
		}
		return message;

	}
	public static void sendemail(String email) {
	 	System.out.println(email);
	 	//System.out.println(message);
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
 
		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("cse08427.sbit@gmail.com","sumoniks90!");
				}
			});

		try {
			//String text="/WEB-INF/jsp/welcomeuser.jsp";
			long i = (long) (1000000000000L +Math.random()*10000000000000L);
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("cse08427.sbit@gmail.com"));
//			 message.addRecipient(Message.RecipientType.TO,
//                     new InternetAddress("nidhi.ardent@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(email));
			
			message.setSubject("Testing Subject");
			message.setText("http://localhost:8080/RateMyCourse/welcomeuser/" +i);
			//message.setText("Hi Admin" + email);
			//message.setText("</a>");
	

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
 	}
}
