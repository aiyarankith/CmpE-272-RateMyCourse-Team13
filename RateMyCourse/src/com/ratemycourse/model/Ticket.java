package com.ratemycourse.model;

public class Ticket {

 private int id;
 private String category ;
 private String email;
 private String message;
 
 public int getId() {
	  return id;
	 }

	 public void setId(int id) {
	  this.id = id;
	 }

 public String getCategory() {
  return category;
 }

 public void setCategory(String category) {
  this.category = category;
 }

 public String getEmail() {
  return email;
 }

 public void setEmail(String email) {
  this.email = email;
 }

 public String getMessage() {
  return message;
 }

 public void setMessage(String message) {
  this.message = message;
 }

}