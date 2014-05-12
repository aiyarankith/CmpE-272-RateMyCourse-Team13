package com.ratemycourse.services;

import java.util.List;

import com.google.gson.JsonObject;
import com.ratemycourse.model.Comment;
import com.ratemycourse.model.Course;
import com.ratemycourse.model.Ticket;
import com.ratemycourse.model.User;

public interface UserService {

	public void insertData(User user);
	public String fetchData(User user);
	public void getTicket(Ticket ticket);
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
	public JsonObject getCourse(String course_id);

	/**
	 * To get course comments, search by url.
	 * @param key - c_id.
	 * @return comments and time stamp.
	 */
	public List<JsonObject> getCourseComments(String course_id);

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

/**
	 * To get top course per university per department
	 * @return top course per university per department
	 */
	public List<List<JsonObject>> getTopRatedPerUniv(String univname);
	/**
	 * To Insert Comment, User Function.
	 * @param commenter_name
	 * @param commenter_email
	 * @param rating
	 * @param c_id
	 * @param name
	 * @param dept
	 * @param university
	 * @param professor
	 * @return confirmation or conflict message.
	 */
	public String insertcomment(Comment comment_detail);
	/**
	 * To get list of courses for which a particular course is being a prerequisite or dependent course.
	 * @param courseId
	 * @return course list
	 */
	public List<JsonObject> getCoursesWithPrereqAs(final String courseId);
}