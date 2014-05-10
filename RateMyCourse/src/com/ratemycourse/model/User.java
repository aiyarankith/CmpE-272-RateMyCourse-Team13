package com.ratemycourse.model;

public class User {

 private int userId;
 private String firstName;
 private String lastName;
/* private String gender;
 private String city;*/
 private String state;
 private String email; 
 private String password;

 public int getUserId() {
  return userId;
 }

 public void setUserId(int userId) {
  this.userId = userId;
 }

 public String getFirstName() {
  return firstName;
 }

 public void setFirstName(String firstName) {
  this.firstName = firstName;
 }

 public String getLastName() {
  return lastName;
 }

 public void setLastName(String lastName) {
  this.lastName = lastName;
 }

 /*public String getGender() {
  return gender;
 }

 public void setGender(String gender) {
  this.gender = gender;
 }

 public String getCity() {
  return city;
 }

 public void setCity(String city) {
  this.city = city;
 }*/
 
 public String getState() {
	  return state;
	 }

	 public void setState(String state) {
	  this.state = state;
	 }
	 
	 public String getEmail() {
		  return email;
		 }

		 public void setEmail(String email) {
		  this.email = email;
		 }
		 
		 public String getPassword() {
			  return password;
			 }

			 public void setPassword(String password) {
			  this.password = password;
			 }
}

