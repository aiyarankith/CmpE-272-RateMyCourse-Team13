package com.ratemycourse.services;

import java.util.List;
import com.ratemycourse.model.*;

public interface UserService {

 public void insertData(User user);
 public List<String> RSSList();
 public String insertCourse(Course details);
public Object getCourse(Course course_id);

}