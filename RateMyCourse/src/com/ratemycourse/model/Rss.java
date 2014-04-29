package com.ratemycourse.model;

import java.util.Date;
import java.util.List;

import com.sun.syndication.feed.synd.SyndContent;

public class Rss {

 private String Title;
 private String Description;
 private String Author;
 private String Date;
 private String RssName;
 private String RssFeed;

 public String getTitle() {
  return Title;
 }

 public void setTitle(String Title) {
  this.Title = Title;
 }

 public String getDescription() {
  return Description;
 }

 public void setDescription(String Description) {
  this.Description = Description;
 }

 public String getAuthor() {
  return Author;
 }

 public void setAuthor(String Author) {
  this.Author = Author;
 }

 public String getDate() {
  return Date;
 }

 public void setDate(String Date) {
  this.Date = Date;
 }
 
 public String getRssName() {
	  return RssName;
}

public void setRssName(String RssName) {
  this.RssName = RssName;
 }
 
public String getRssFeed() {
	  return RssFeed;
	 }

public void setRssFeed(String RssFeed) {
  this.RssFeed = RssFeed;
 }
}

