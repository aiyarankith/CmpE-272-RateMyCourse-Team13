package com.ratemycourse.model;

public class Course {

	private String description;
	private String demo_video_link;
	private String related_doc_link;
	private String name;
	private String c_id;
	private String dept;
	private String email;
	private String university;
	private String professor;
	private String prereq;
	private String course_id;


	//Course ID
	public String getc_id() {
		return c_id;
	}
	public void setc_id(String c_id) {
		this.c_id = c_id;
	}

	//Course Name
	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}	

	//Department
	public String getdept() {
		return dept;
	}
	public void setdept(String dept) {
		this.dept = dept;
	}

	//University Name
	public String getuniversity() {
		return university;
	}
	public void setuniversity(String university) {
		this.university = university;
	}

	//Email
	public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email = email;
	}

	//Professor
	public String getprofessor() {
		return professor;
	}
	public void setprofessor(String professor) {
		this.professor = professor;
	}

	//Description
	public void setdescription(String description) {
		this.description = description;
	}
	public String getdescription() {
		return description;
	}

	//Video Link
	public void setdemo_video_link(String demo_video_link) {
		this.demo_video_link = demo_video_link;
	}
	public String getdemo_video_link() {
		return demo_video_link;
	}

	//Document Link
	public void setrelated_doc_link(String related_doc_link) {
		this.related_doc_link = related_doc_link;
	} 
	public String getrelated_doc_link() {
		return related_doc_link;
	}

	//Course ID from Search
	public void setcourse_id(String course_id) {
		this.course_id = course_id;
	} 
	public String getcourse_id() {
		return course_id;
	}

	//Pre-req
	public void setprereq(String prereq) {
		this.prereq = prereq;
	} 
	public String getprereq() {
		return prereq;
	}


}




