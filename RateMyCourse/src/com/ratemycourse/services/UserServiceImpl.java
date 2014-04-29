package com.ratemycourse.services;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.net.URL;
import java.util.Date;
import java.util.Iterator;
 







import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;
import com.google.gson.JsonObject;
import com.ratemycourse.model.User;
import com.ratemycourse.model.Rss;
import com.ratemycourse.model.Course;

import java.util.HashMap;
import java.util.Map;






//CouchDB Imports
import org.lightcouch.CouchDbClient;
import org.lightcouch.CouchDbProperties;
import org.lightcouch.DocumentConflictException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


public class UserServiceImpl implements UserService {

 
 @Autowired
 DataSource dataSource;

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

}
