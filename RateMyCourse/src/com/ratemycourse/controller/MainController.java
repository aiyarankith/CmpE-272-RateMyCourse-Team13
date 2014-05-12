package com.ratemycourse.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.ratemycourse.model.User;
import com.ratemycourse.model.Rss;
import com.ratemycourse.services.SearchService;
import com.ratemycourse.services.UserService;
import com.ratemycourse.model.Course;
import com.ratemycourse.model.Comment;


@Controller
public class MainController {

	@Autowired
	UserService userService;

	@Autowired
	SearchService searchService;
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

	//login page
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login_page(@ModelAttribute User user) {

		return "login";
	}
	//Valid-Admin
	@RequestMapping(value = "/welcomeadmin", method = RequestMethod.GET)
	public String welcome_page(@ModelAttribute User user) {

		return "welcome";
	}

	//Registration Button 
	@RequestMapping("/insert")
	public String insertData(@ModelAttribute("user") User user) {
		System.out.println("Data At Controller:: "+user);
		if (user != null)
			userService.insertData(user);
		return "redirect:index";
	}

	//login page for admin
	@RequestMapping("/fetchdata")
	public String fetchData(@ModelAttribute("details") Course details, @ModelAttribute User user, HttpSession session, final RedirectAttributes redirectedattributes) {
		System.out.println("Data At fetch:: "+user);
		String invalid_login_message;
		String first_name = userService.fetchData(user);

		if(first_name != null){
			session.setAttribute("first_name", first_name);
			return "redirect:index";
		}
		if (session.getAttribute("first_name") == null){
			invalid_login_message = "Invalid Login";
			redirectedattributes.addFlashAttribute("invalid_login_message",invalid_login_message);
		}

		return "redirect:login";
	}
	//Admin Logout
	@RequestMapping(value = "/admin_logout")
	public String admin_logout(HttpSession session) {
		session.invalidate();
		return "redirect:index";
	}

	//CouchDB Insert Course Page (Admin)
	@RequestMapping(value="/add_course", method = RequestMethod.GET)
	public String addcourse(@ModelAttribute("details") Course details, HttpSession session, final RedirectAttributes redirectedattributes) {
		if(session.getAttribute("first_name") != null){
			return "add_course";
		} else {
			redirectedattributes.addFlashAttribute("unauth_access","Please Login as Admin in order to Access this page");
			return "redirect:index";
		}
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
	public ModelAndView most_followed_course(@RequestParam(value="numOfCourses", defaultValue="10") int count) {

		List<JsonObject> courseList= userService.getMostFollowedCourse(count);
		return new ModelAndView ("most_followed_course","courseList",courseList);
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


	//Insert Comments
	@RequestMapping("/insert_comment")
	public String insert_comment(@RequestParam String course_id, @ModelAttribute("comment_detail") Comment comment_detail, final RedirectAttributes redirectedattributes, HttpServletRequest req) {
		System.out.println("Course At Controller:: " +comment_detail);
		String message = null;
		if (comment_detail != null) {
			message = new String (userService.insertcomment(comment_detail));
			redirectedattributes.addFlashAttribute("message",message);
			System.out.println("Message at insert comment :"+message);
		}
		if(message != null){
			//req.setAttribute("confirmation_message", message);
			redirectedattributes.addFlashAttribute("confirmation_message",message);

		}
		System.out.println("confirmation_message :"+message);

		/**
		 * Ratings from the user
		 */

		ArrayList <String> user_type = new ArrayList<String> (); 
		user_type.add("Enrolled Student");
		user_type.add("Unenrolled Student");
		user_type.add("Industrialist");

		ArrayList <String> stars = new ArrayList<String> (); 
		stars.add("1");
		stars.add("2");
		stars.add("3");
		stars.add("4");
		stars.add("5");

		req.setAttribute("user_type", user_type);
		req.setAttribute("stars", stars);

		return "redirect:index";
	}

	//Course Page Action to Search
	@RequestMapping(value="/get_course", method = RequestMethod.GET)
	public ModelAndView get_course(@RequestParam String courseId, @ModelAttribute("comment_detail") Comment comment_detail, HttpServletRequest req) {
		List<JsonObject> course_comments = null;
		List<JsonObject> prereqForCourseList = null;
		JsonObject course_details = userService.getCourse(courseId);
		System.out.println("course_details:"+course_details);
		if (course_details != null) {
			course_comments = userService.getCourseComments(courseId);
		}
		if (course_comments != null) {
			prereqForCourseList = userService.getCoursesWithPrereqAs(courseId);
		}
		System.out.println("COurse Comments :" +course_comments);
		req.setAttribute("course_comments", course_comments != null && course_comments.isEmpty() ? null : course_comments);
		req.setAttribute("course_prereq4",prereqForCourseList);
		/**
		 * Ratings from the user
		 */

		ArrayList <String> user_type = new ArrayList<String> (); 
		user_type.add("Enrolled Student");
		user_type.add("Unenrolled Student");
		user_type.add("Industrialist");

		ArrayList <String> stars = new ArrayList<String> (); 
		stars.add("1");
		stars.add("2");
		stars.add("3");
		stars.add("4");
		stars.add("5");

		req.setAttribute("user_type", user_type);
		req.setAttribute("stars", stars);

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
	/**
	 * Search courses based on various categories,
	 * 	1)Course Name
	 * 	2)Course ID
	 * 	3)Course Description
	 * @param searchValue
	 * @param searchCategory
	 * @param searchLevel
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/search", method = RequestMethod.POST)
	public String search(@RequestParam String searchValue,
			@RequestParam String searchCategory,
			HttpServletRequest req) {
		List<JsonObject> courseList = searchService.search(searchValue.trim().toLowerCase(), searchCategory);
		String cID = null;
		Iterator<JsonObject> itr = courseList.iterator();
		System.out.println(courseList.size());
		if (courseList != null & courseList.size() == 1) {
			while (itr.hasNext()) {
				JsonObject courseDetails = (JsonObject) itr.next().get("value");
				System.out.println("courseDetails"+courseDetails);
				cID = courseDetails.get("c_id").getAsString();
				return "redirect:get_course?courseId="+ cID;
			}
		}
		req.setAttribute("courseList", courseList);
		return "search";
		//return new ModelAndView("search", "courseList", courseList);
	}

}
