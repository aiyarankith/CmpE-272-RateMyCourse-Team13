 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

 <!-- Start navigation area -->
        <div id="navigation">

        	<div id="navigation_wrap">

                <!-- Start contact info area -->
                <div id="conteactinfo"><strong>Rate My Course</strong></div>
                <!-- End contact info area -->
                <!-- Start navigation -->
                <div id="navi">
                
                    <ul>
                    
                        <li><a href="index.jsp" title="Response Home">Home</a></li>
                        <li><a href="#" title="Response Features">Top Facts</a>
                        	<ul>
                            	<li><a href="most_rated_course" title="Response Buttons">Most Rated Course</a></li>
                                <li><a href="most_followed_course" title="Response Columns">Most Followed Course</a></li>
                                <li><a href="industry_oriented_course" title="Response Icons &amp; Lists">Industry Oriented Course</a></li>
                                <li><a href="top_courses_colleges" title="Response Notifications">Top Courses By Colleges</a></li>
                            </ul>
                            <% if(session.getAttribute("first_name") != null) { %>
                            <li><a href="add_course">Course</a>
                        	<ul>
                        		<li><a href="add_course" title="Response Buttons">Add Course</a></li>
                            	<li><a href="edit_course" title="Response Buttons">Edit Course</a></li>
                            </ul>
                        </li>
                        <% } else { %>
                        <% } %>
                        <li><a href="about" title="Respons'se Portfolio">About</a>
                       
                      	 <% if(session.getAttribute("first_name") != null) { %>
                        	
                        </li>
                        <li><a href="<c:url value="registration" />">Create an account</a></li>
                    	<% } else { %>
                    	<% } %>
                    	<li><a href="user_ticket" title="Respons'se Portfolio">Contact Us</a>
                    	<% if(session.getAttribute("first_name") != null) { %>
                    	<li><a href="admin_logout" title="Respons'se Portfolio">Logout</a>
                    	<% } else { %>
                    	<li><a href="login" title="Respons'se Portfolio">Login</a>
                    	<% } %>
                    	
                    	
                    	
                    </ul>
                
                </div>
                <!-- End navigation -->
                
			</div>
			 
        </div>
        <!-- End navigation area -->
		        
		
        