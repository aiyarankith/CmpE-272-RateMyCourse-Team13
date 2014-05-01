package com.ratemycourse.services;

import java.util.List;
import com.ratemycourse.model.*;

public interface UserService {

	public void insertData(User user);
	public List<String> RSSList();
	public String insertCourse(Course details);
	public Object getCourse(Course course_id);
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
}