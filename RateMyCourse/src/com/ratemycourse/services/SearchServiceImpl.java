package com.ratemycourse.services;

import java.util.List;

import javax.sql.DataSource;

//CouchDB Imports
import org.lightcouch.CouchDbClient;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.JsonObject;


public class SearchServiceImpl implements SearchService {


	@Autowired
	DataSource dataSource;

	//	@Autowired
	//	private CouchDbClient dbClient;
	CouchDbClient dbClient = new CouchDbClient("couchdb.properties");


	/* (non-Javadoc)
	 * @see com.ratemycourse.services.UserService#search(java.lang.String)
	 */
	@Override
	public List<JsonObject> search(String value, String category) {
		String byCourseName = "CNAME";
		String byCourseId = "CID";
		String byCourseDesc = "CDESC";
		String level_full = "FULL";
		String level_partial = "STARTS_WITH";
		List<JsonObject> courseList = null;
		try {
			if (byCourseName.equals(category)) {
				//sample view: http://127.0.0.1:5984/demo/_design/views/_view/by_course_name?key=""
				courseList = dbClient.view("views/by_course_name")
						.key(value)
						.query(JsonObject.class);
				if (courseList != null && courseList.size() < 1) {
					String endKeyValue = String.valueOf((char) (value.charAt(0) + 1));
					System.out.println("end"+endKeyValue);
					courseList = dbClient.view("views/by_course_name")
							.startKey(value)
							.endKey(endKeyValue)
							.query(JsonObject.class);
				}
				System.out.println("cList::"+courseList);
			} else if (byCourseId.equals(category)) {
				//sample view: http://127.0.0.1:5984/demo/_design/views/_view/by_course_id?startkey=""&endkey=""
				courseList = dbClient.view("views/by_course_id")
						.key(value)
						.query(JsonObject.class);
				if (courseList != null && courseList.size() < 1) {
					String endKeyValue = String.valueOf((char) (value.charAt(value.length()-1) + 1));
					endKeyValue = value.substring(0, value.length()-1) + endKeyValue;
					courseList = dbClient.view("views/by_course_id")
							.startKey(value)
							.endKey(endKeyValue)
							.query(JsonObject.class);
				}
			} else if (byCourseDesc.equals(category)) {
				//sample view: http://127.0.0.1:5984/demo/_design/views/_view/by_course_desc
				courseList = dbClient.view("views/by_course_desc")
						.key(value)
						.query(JsonObject.class);
			}
		} catch (RuntimeException exp) {
			exp.printStackTrace();
		}

		return courseList;
	}
}

