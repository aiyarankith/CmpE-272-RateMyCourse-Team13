package com.ratemycourse.services;

import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.ratemycourse.model.*;

public interface UserService {

	public void insertData(User user);
	public boolean fetchData(User user);

	/**
	 * To Retrive RSS Feeds from any sourse.
	 * @return RSS Feeds List.
	 */
	public List<String> RSSList();

	/**
	 * To Insert Course, Admin Function.
	 * @param description
	 * @param demo_video_link
	 * @param related_doc_link
	 * @param c_id
	 * @param name
	 * @param dept
	 * @param university
	 * @param professor
	 * @return confirmation or conflict message.
	 */
	public String insertCourse(Course details);

	/**
	 * To Course Details on Search with Course ID.
	 * @param key - c_id.
	 * @return course details.
	 */
	public JsonObject getCourse(Course course_id);

	/**
	 * To get course comments, search by url.
	 * @param key - c_id.
	 * @return comments and time stamp.
	 */
	public List<JsonObject> getCourseRatings(Course course_id);

	/**
	 * To verify user rating confirmation mail, recalculate and update the course rating details.
	 * @param key - unique key from the url.
	 * @return confirmation message.
	 */
	public String verifyAndUpdateRating(final String key);

	/**
	 * To create document (doc02) for user rating and comments.   
	 * @param userName
	 * @param email
	 * @param userType
	 * @param userRating
	 * @param comment
	 * @return
	 */
	public String saveRating(final String userName, final String email, final String userType,
			final String userRating, final String comment);
	/**
	 * To get top N courses list.
	 * @return top course list as JsonObject
	 */
	public List<JsonObject> getNTopRtdCourse(final int count);
	
	/**
	 * To get top industry oriented courses
	 * @return top industry oriented course list as JsonObject
	 */
	public List<JsonObject> getIndOrientedCourse(final int count);
	
	/**
	 * To get most followed courses
	 * @return top industry oriented course list as JsonObject
	 */
	public List<JsonObject> getMostFollowedCourse(final int count);
}