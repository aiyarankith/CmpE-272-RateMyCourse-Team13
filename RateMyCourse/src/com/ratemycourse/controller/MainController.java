package com.ratemycourse.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ratemycourse.model.User;
import com.ratemycourse.model.Rss;
import com.ratemycourse.services.UserService;

import com.ratemycourse.model.Course;
//import com.ratemycourse.services.UserService;


@Controller
public class MainController {

@Autowired
UserService userService;

//Index Page
@RequestMapping(value = "/index", method = RequestMethod.GET)
public ModelAndView getUserLIst() {
	
	  List<String> RSSList = userService.RSSList();
	  
	  return new ModelAndView("index", "RSSList", RSSList);
}

//Registration Page
@RequestMapping(value = "/registration", method = RequestMethod.GET)
public String registration_page(@ModelAttribute User user) {
  
	return "registration";
}

//Registration Button 
@RequestMapping("/insert")
public String insertData(@ModelAttribute User user) {
	System.out.println("Data At Controller:: "+user);
 if (user != null)
  userService.insertData(user);
 return "index";
}

//CouchDB Insert Course Page (Admin)
@RequestMapping(value="/add_course", method = RequestMethod.GET)
public String addcourse(@ModelAttribute("details") Course details) {
	return "add_course";
}

//CouchDB Insert Course (Admin)
@RequestMapping("/insert_course")
public String insert_course(@ModelAttribute("details") Course details, final RedirectAttributes redirectedattributes) {
	System.out.println("Course At Controller:: " +details);
	String message;
	if (details != null) {
		message = new String (userService.insertCourse(details));
		redirectedattributes.addFlashAttribute("message",message);
	}
return "redirect:index";
}

//Most Rated Course Page
@RequestMapping(value="/most_rated_course", method = RequestMethod.GET)
public String most_rated_course() {
	return "most_rated_course";
}

//Most Followed Course Page
@RequestMapping(value="/most_followed_course", method = RequestMethod.GET)
public String most_followed_course() {
	return "most_followed_course";
}

//Most Industry Course Page
@RequestMapping(value="/industry_oriented_course", method = RequestMethod.GET)
public String industry_oriented_course() {
	return "industry_oriented_course";
}

//Top Courses College wise Page
@RequestMapping(value="/top_courses_colleges", method = RequestMethod.GET)
public String top_courses_colleges() {
	return "top_courses_colleges";
}

//Course Ratings Page
@RequestMapping(value="/course_ratings", method = RequestMethod.GET)
public String course_ratings() {
	return "course_ratings";
}

//About Page
@RequestMapping(value="/about", method = RequestMethod.GET)
public String about() {
	return "about";
}
}
