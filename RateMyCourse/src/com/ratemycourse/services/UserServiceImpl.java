package com.ratemycourse.services;

import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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
import org.lightcouch.NoDocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.google.gson.JsonObject;
import com.ratemycourse.model.Comment;
import com.ratemycourse.model.Course;
import com.ratemycourse.model.Rss;
import com.ratemycourse.model.Ticket;
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
	public void getTicket(Ticket ticket) {

		String sql = "INSERT INTO ticket "
				+ "(category,email,message) VALUES (?, ?, ?)";

		System.out.println("Values : "+ticket);

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(
				sql,
				new Object[] {ticket.getCategory(), ticket.getEmail(),
						ticket.getMessage() });
		UserServiceImpl.sendEmail(ticket.getEmail(), ticket.getCategory(), ticket.getMessage());


	}
	public static void sendEmail (String email, String category, String msg) {
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
			//long i = (long) (1000000000000L +Math.random()*10000000000000L);
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("cse08427.sbit@gmail.com"));
			message.addRecipient(Message.RecipientType.TO,
					new InternetAddress("nidhi.ardent@gmail.com"));
			message.addRecipients(Message.RecipientType.TO,
					InternetAddress.parse(email));

			message.setSubject(category);
			//message.setText("http://localhost:8080/RateMyCourse/welcomeuser/" +i);
			message.setText("Welcome Guest, Your "+category+" request has been received. We'll get back to you soon. \n Message: " +msg+ "\n Have a nice day. \n\n Regards,\nAdmin");			//message.setText("</a>");


			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}


	@Override
	public String fetchData(User user) {
		String email=user.getEmail();
		String password=user.getPassword();
		String f_name = null;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		String username="";
		String pass="";	 

		String sql = "select email, password, first_name from user where email = '"+email+"' and password='"+password+"'";
		List results=jdbcTemplate.queryForList(sql);
		for (Object result : results) {
			System.out.println(result);
			HashMap map = (HashMap) result;

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
			return f_name;
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

		String result = null;
		JsonObject add_course = new JsonObject();
		add_course.addProperty("_id", details.getc_id());
		add_course.addProperty("is_course", "Yes");
		add_course.addProperty("c_id", details.getc_id());
		add_course.addProperty("name", details.getname());
		add_course.addProperty("description", details.getdescription());
		add_course.addProperty("dept", details.getdept());
		add_course.addProperty("university", details.getuniversity());

		if(details.getprofessor() != null){
			add_course.addProperty("professor", details.getprofessor());
		} else {
			add_course.addProperty("professor", "");
		}

		if(details.getrelated_doc_link() != null){
			add_course.addProperty("related_doc_link", details.getrelated_doc_link());
		} else {
			add_course.addProperty("related_doc_link", "");
		}

		if(details.getdemo_video_link() != null){
			add_course.addProperty("demo_video_link", details.getdemo_video_link());
		} else {
			add_course.addProperty("demo_video_link", "");
		}
		add_course.addProperty("overall_rating", "0");
		add_course.addProperty("overall_count", "0");
		add_course.addProperty("ind_user_rating", "0");
		add_course.addProperty("overall_count", "0");
		add_course.addProperty("est_user_rating", "0");
		add_course.addProperty("est_user_count", "0");
		add_course.addProperty("uest_user_rating","0");
		add_course.addProperty("uest_user_count", "0");

		if(details.getprereq() != null){
			add_course.addProperty("prereq", details.getprereq());
		} else {
			add_course.addProperty("prereq", "");
		}


		System.out.println("Complete :"+add_course);

		try {
			dbClient.save(add_course);
			result ="Course Entered Successfully";
		} catch (DocumentConflictException e) {
			e.printStackTrace();
			result = "Course Already Exists";
		}

		return result;

	}

	@Override
	public JsonObject getCourse(String cId) {
		JsonObject courseDetails = null;
		try {
			List<JsonObject> courseList = null;
			//sample view: http://127.0.0.1:5984/demo/_design/views/_view/by_course_id?key=""
			courseList = dbClient.view("views/by_course_id")
					.key(cId.trim().toLowerCase())
					.query(JsonObject.class);
			System.out.println("get course  courseList:"+courseList);
			if (courseList.isEmpty()) {
				return null;
			}
			courseDetails = courseList.listIterator().next().getAsJsonObject();
		} catch (NoDocumentException noDocEx) {
			noDocEx.printStackTrace();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return courseDetails.get("value").getAsJsonObject(); 		
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
					.key(cId.trim().toLowerCase())
					.descending(true)
					.query(JsonObject.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Get Ratings::: "+commentList);
		return commentList;		

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
	public String insertcomment(Comment comment_detail) {		//Calculate the date
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date dates = new Date();
	String date = dateFormat.format(dates);
		
	//Calculate user rating based on user type.
	String userType = comment_detail.gettype_of_user();
	double total_ratings = 0.00;
	total_ratings = (Float.valueOf(comment_detail.getcontent_rating()) + Float.valueOf(comment_detail.gettechnology_rating()) + Float.valueOf(comment_detail.getoverall_rating()))/3;
	System.out.println("userType:"+userType);
	if ("Industrialist".equals(userType)) {
		comment_detail.settype_of_user("IND");
		total_ratings = total_ratings * 1;
	} else if ("Enrolled Student".equals(userType)) {
		comment_detail.settype_of_user("EST");
		total_ratings = total_ratings * 0.9;
	} else {
		comment_detail.settype_of_user("UEST");
		total_ratings = total_ratings * 0.6;
	}
	System.out.println("user_ratings:" +total_ratings);

	String message = null;
	JsonObject doc_RatingAndComments = new JsonObject();
	doc_RatingAndComments.addProperty("type", comment_detail.gettype_of_user());
	doc_RatingAndComments.addProperty("user_rating", String.format("%.2f", total_ratings));
	doc_RatingAndComments.addProperty("comment", comment_detail.getcomment());
	doc_RatingAndComments.addProperty("c_id", comment_detail.getcourse_id());
	doc_RatingAndComments.addProperty("c_name", comment_detail.getcourse_name());
	doc_RatingAndComments.addProperty("user_name", comment_detail.getcommenter_name());
	doc_RatingAndComments.addProperty("email", comment_detail.getcommenter_email());
	doc_RatingAndComments.addProperty("date", date);
	
	System.out.println("Complete :"+doc_RatingAndComments);

	try {
		long mailKey = RatingVerificationServiceImpl.sendemail(comment_detail.getcommenter_email());
		if (mailKey != -1) {
			if (mailKey == 0) {
				doc_RatingAndComments.addProperty("is_verified", true);
			} else {
				doc_RatingAndComments.addProperty("is_verified", false);
				doc_RatingAndComments.addProperty("unique_key", ""+ mailKey +"");
			}
			dbClient.save(doc_RatingAndComments);
			message = "Comment Added! Please verify your email id in order to confirm comments";
		} else {
			message = "Sorry, Unable to accept your comments.";
		}
	} catch (DocumentConflictException e) {
		e.printStackTrace();
	}
	return message;
}
@Override
public List<List<JsonObject>> getTopRatedPerUniv(String univname) {
	List<JsonObject> courseList = null;
	List<JsonObject> deptList=null;
	List<List<JsonObject>> courseUnivList=new ArrayList<List<JsonObject>>();
	String dept=null;
	try {
		/*
		 * Corresponding sample CouchDB query
		 * http://127.0.0.1:5984/demo/_design/views/_view/by_top_rated_per_univ?startkey=%5B%22san%20jose%20state%20university%22%2C%22general+engineering%22%2C%7B%7D%5D&endkey=%5B%22san+jose+state+university%22%2C%22Computer+engineering%22%5D&descending=true
		 */
	
		
		List<String> endval=Arrays.asList(new String[] {univname,"z"});
		System.out.println(endval);
		List<String> startval=Arrays.asList(new String[] {univname}); 
		deptList= dbClient.view("views/get_dept_for_college")
				.startKey(startval)
				.endKey(endval)
				.group(true)
				.query(JsonObject.class);
		
		System.out.println(deptList);
		for(int i=0;i<deptList.size();i++){
			dept=deptList.get(i).get("key").getAsJsonArray().get(1).getAsString().toLowerCase();
			List<String> start=Arrays.asList(new String[] {univname,dept,"a"}); 
			List<String> end=Arrays.asList(new String[] {univname,dept}); 
			//System.out.println(start);
			//System.out.println(end);
			System.out.println(dept);
			if(!dept.trim().equals("")){
				
			courseList= dbClient.view("views/by_top_rated_per_univ")
				.descending(true)
				.startKey(start) 
				.endKey(end)
				.limit(10)
				.query(JsonObject.class);
			courseUnivList.add(courseList);
			//System.out.println(courseList);
			System.out.println(courseUnivList);
		}
		}
		if (courseList.isEmpty()) {
			JsonObject error = new JsonObject();
			error.addProperty("error_type", "data_missing");
			error.addProperty("error_message", "Course data missing");
			courseList.add(error);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return courseUnivList;
}


	@Override
	public List<JsonObject> getCoursesWithPrereqAs(String courseId) {
		List<JsonObject> courseList = null;
		try {
			//sample view: http://127.0.0.1:5984/demo/_design/views/_view/by_course_id?key=""
			courseList = dbClient.view("views/is_prereq_for")
					.key(courseId.trim().toLowerCase())
					.query(JsonObject.class);
			System.out.println("4:"+courseList.toString());
		} catch (NoDocumentException noDocEx) {
			noDocEx.printStackTrace();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return courseList; 		
	}
}
