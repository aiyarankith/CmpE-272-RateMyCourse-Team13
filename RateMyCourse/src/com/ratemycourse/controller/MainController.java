package com.ratemycourse.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
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
		return "redirect:add_course";
	}
	//Most Rated Course Page
		@RequestMapping(value="/most_rated_course", method = RequestMethod.GET)
		public ModelAndView most_rated_course(@RequestParam(value = "numOfCourses", defaultValue = "10") int count) {
			List<JsonObject> courseList = userService.getNTopRtdCourse(count);
			return new ModelAndView("most_rated_course", "courseList", courseList);
		}

	
	

	//Most Followed Course Page
	@RequestMapping(value="/most_followed_course", method = RequestMethod.GET)
	public String most_followed_course() {
		return "most_followed_course";
	}

	//Most Industry Course Page
	@RequestMapping(value="/industry_oriented_course", method = RequestMethod.GET)
	public ModelAndView industry_oriented_course(@RequestParam(value = "numOfCourses", defaultValue = "10") int count) {
		List<JsonObject> courseList = userService.getIndOrientedCourse(count);
		return new ModelAndView("industry_oriented_course", "courseList", courseList);
	}

	//Top Courses College wise Page
	@RequestMapping(value="/top_courses_colleges", method = RequestMethod.GET)
	public String top_courses_colleges() {
		return "top_courses_colleges";
	}

	//Course Ratings Page
	@RequestMapping(value="/course_ratings", method = RequestMethod.GET)
	public String course_ratings(@ModelAttribute("course_id") Course course_id) {
		return "course_ratings";
	}
	//Course Page Action to Search
	@RequestMapping(value="/get_course", method = RequestMethod.POST)
	public ModelAndView get_course(@ModelAttribute("course_id") Course course_id) {
		JsonObject course_details = userService.getCourse(course_id);
		List<JsonObject> course_ratings = userService.getCourseRatings(course_id);
		
		 Map<String, Object> map = new HashMap<>();
		 map.put("ratings", course_ratings);
		 map.put("details", course_details);
		 ModelAndView mav = new ModelAndView("someView", map);
		 mav.addAllObjects(map);

		return new ModelAndView("course_ratings", "course_details", course_details);
	}



	//About Page
	@RequestMapping(value="/about", method = RequestMethod.GET)
	public ModelAndView about() {
		Map m1 = new HashMap();
		m1.put("Zara", "8");
		m1.put("Mahnaz", "31");
		m1.put("Ayan", "12");
		m1.put("Daisy", "14");

		return new ModelAndView("about", "mav", m1);

	}
	//User rating and comment confirmation
		@RequestMapping(value="/confirm_user_activity", method = RequestMethod.GET)
		public ModelAndView verifyAndUpdateRating(@RequestParam String key, HttpServletRequest req) {
			String message = userService.verifyAndUpdateRating(key);
			List<String> RSSList = userService.RSSList();
			req.setAttribute("message", message);
			return new ModelAndView("index", "RSSList", RSSList);
		}

		//To save user rating and comments
		@RequestMapping(value="/save_rating", method = RequestMethod.POST)
		public String saveRating(@RequestParam String userName,
				@RequestParam String email,
				@RequestParam String userType,
				@RequestParam String userRating,
				@RequestParam String comment,
				HttpServletRequest req) {
			String message = userService.saveRating(userName, email, userType, userRating, comment);
			req.setAttribute("message", message);
			return "course_ratings";
		}

}
