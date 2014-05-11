package com.ratemycourse.model;

public class Comment {
	private String commenter_name;
	private String commenter_email;
	private String type_of_user;
	private String comment;
	private String content_rating;
	private String technology_rating;
	private String overall_rating;
	private String course_id;
	private String course_name;

	//Course Commenter Name
	public String getcommenter_name() {
		return commenter_name;
	}
	public void setcommenter_name(String commenter_name) {
		this.commenter_name = commenter_name;
	}

	//Course commenter_email
	public String getcommenter_email() {
		return commenter_email;
	}
	public void setcommenter_email(String commenter_email) {
		this.commenter_email = commenter_email;
	}	

	//Type of user
	public String gettype_of_user() {
		return type_of_user;
	}
	public void settype_of_user(String type_of_user) {
		this.type_of_user = type_of_user;
	}

	//Comments
	public String getcomment() {
		return comment;
	}
	public void setcomment(String comment) {
		this.comment = comment;
	}

	//Content Rating
	public String getcontent_rating() {
		return content_rating;
	}
	public void setcontent_rating(String content_rating) {
		this.content_rating = content_rating;
	}

	//Technology Rating
	public String gettechnology_rating() {
		return technology_rating;
	}
	public void settechnology_rating(String technology_rating) {
		this.technology_rating = technology_rating;
	}

	//Overall rating
	public String getoverall_rating() {
		return overall_rating;
	}
	public void setoverall_rating(String overall_rating) {
		this.overall_rating = overall_rating;
	}

	//Course ID
	public String getcourse_id() {
		return course_id;
	}
	public void setcourse_id(String course_id) {
		this.course_id = course_id;
	}

	//Course name
	public String getcourse_name() {
		return course_name;
	}
	public void setcourse_name(String course_name) {
		this.course_name = course_name;
	}


}
