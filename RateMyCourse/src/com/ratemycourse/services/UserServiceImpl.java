package com.ratemycourse.services;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

//CouchDB Imports
import org.lightcouch.CouchDbClient;
import org.lightcouch.CouchDbProperties;
import org.lightcouch.DesignDocument;
import org.lightcouch.DocumentConflictException;
import org.lightcouch.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.google.gson.JsonObject;
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
				+ "(user_id, first_name,last_name, gender, city) VALUES (?, ?, ?, ?,?)";

		System.out.println("Values : "+user);

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(
				sql,
				new Object[] { user.getUserId(), user.getFirstName(), user.getLastName(),
						user.getGender(), user.getCity() });


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
		// System.out.println("USerService::: "+items.get(2));
		//System.out.println("USerService::: "+items.get(3));

		return items;
	}

	@Override
	public String insertCourse(Course details) {
		System.out.println("Course At Service:: " +details);
		System.out.println("Course At Controller:: " +details.getdept());


		CouchDbProperties properties = new CouchDbProperties()
		.setDbName("ankith")
		.setCreateDbIfNotExist(true)
		.setProtocol("http")
		.setHost("127.0.0.1")
		//.setHost("aiyarankith.cloudbees.cloudant.com")
		.setPort(5984)
		.setConnectionTimeout(0);
		//.setUsername("aiyarankith.cloudbees")
		//.setPassword("bs5854fh4I3nnGYJQ5e58FML");
		CouchDbClient dbClient = new CouchDbClient(properties);

		// CouchDbClient dbClient = new CouchDbClient("./couchdb.properties");
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

		//System.out.println("Find Result :" +json.toString(dbClient.find("asdgads")));
		//model.addAttribute("message", "Hello Spring MVC Framework!"+dbClient.getBaseUri());
		//System.out.println(dbClient.getBaseUri());
	}

	@Override
	public Object getCourse(Course course_details) {


		CouchDbProperties properties = new CouchDbProperties()
		.setDbName("ankith")
		.setCreateDbIfNotExist(true)
		.setProtocol("http")
		.setHost("127.0.0.1")
		//.setHost("aiyarankith.cloudbees.cloudant.com")
		.setPort(5984)
		.setConnectionTimeout(0);
		//.setUsername("aiyarankith.cloudbees")
		//.setPassword("bs5854fh4I3nnGYJQ5e58FML");
		CouchDbClient dbClient = new CouchDbClient(properties);

		// CouchDbClient dbClient = new CouchDbClient("./couchdb.properties");
		// Map<String, Object> map = new HashMap<>();



		//System.out.println("Find Result");
		//ArrayList<String> result = (ArrayList <String>) map.get(course_details.getcourse_id().toLowerCase());
		JsonObject json = dbClient.find(JsonObject.class, course_details.getcourse_id());

		//HashMap<String,Object> result = new ObjectMapper().readValue(json, HashMap.class); 	
		//JSONObject result = (JSONObject)new JSONParser().parse(json);
		System.out.println("Course result :" +json);



		return json;

		//System.out.println("Find Result :" +json.toString(dbClient.find("asdgads")));
		//model.addAttribute("message", "Hello Spring MVC Framework!"+dbClient.getBaseUri());
		//System.out.println(dbClient.getBaseUri());
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
			//access view[unique_key,doc] to get the doc_02;
			DesignDocument designDoc = dbClient.design().getFromDb("_design/views");//dd name ie._design/view name
			Response response;
			response = dbClient.design().synchronizeWithDb(designDoc);//dunno wt this shit is doing

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
}
