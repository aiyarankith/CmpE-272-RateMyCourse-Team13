<!DOCTYPE HTML>
<%@page import="com.google.gson.JsonElement"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="org.json.simple.*"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.google.gson.JsonObject"%>


<html>
<head>
<meta charset="utf-8">
<title>Course Ratings Page</title>
<meta name="description"
	content="Response Premium Html Responsive Template - Blog Section" />
<meta name="keywords"
	content="Responsive Html, Responsive Template, Response, Free Icons, List Section" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="grey" />
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0;" />
<link rel="shortcut icon"
	href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" />
<link rel="bookmark icon"
	href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" />
<link href="css/main.css" rel="stylesheet" type="text/css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
<script src="js/twitter.js"></script>
<script src="js/custom.js"></script>
<script>
	//// Start Simple Sliders ////
	$(function() {
		setInterval("rotateDiv()", 10000);
	});

	function rotateDiv() {
		var currentDiv = $("#simpleslider div.current");
		var nextDiv = currentDiv.next();
		if (nextDiv.length == 0)
			nextDiv = $("#simpleslider div:first");

		currentDiv.removeClass('current').addClass('previous').fadeOut('2000');
		nextDiv.fadeIn('3000').addClass('current', function() {
			currentDiv.fadeOut('2000', function() {
				currentDiv.removeClass('previous');
			});
		});

	}
	//// End Simple Sliders ////
</script>
<script type="text/javascript">
function showhidediv(rad){
var rads=document.getElementsByName(rad.name);
document.getElementById('one').style.display=(rads[0].checked)?'block':'none' ;
document.getElementById('two').style.display=(rads[1].checked)?'block':'none' ;
document.getElementById('three').style.display=(rads[2].checked)?'block':'none' ;
}
</script>
</head>

<body>
	<div id="header">
		<%@include file="includes/menu.jsp"%>
		<div id="header_small">

			<form action="${pageContext.request.contextPath}/search"
				method="post" name="searchForm">
				<span id="search-page-border"> <select class="search-terms"
					name="searchCategory" id="searchCategory" style="width: auto"
					data-selected="CNAME">
						<option id="cname" value="CNAME">Course Name</option>
						<option id="cid" value="CID">Course ID</option>
						<option id="cdesc" value="CDESC">Course Content</option>
				</select>
				<label class="accessibly-hidden">Search for:</label>
				<input
					type="text" class="search-terms" name="searchValue" id="searchValue"
					onfocus="if(this.value == 'Search...') { this.value = ''; }"
					onblur="if(this.value == '') { this.value = 'Search...'; }"
					placeholder="Search..." /> <label for="search-which"
					class="accessibly-hidden">Search these:</label>
				</span>
				<input type="submit" name="search-submit" id="search-submit"
					value="Search" />
			</form>

		</div>
		<div class="clear"></div>

	</div>

	<div id="main">
		<!-- Start H1 Title -->
		<div class="titlesnormal">

			<h1>Course Ratings</h1>

			<span></span>

		</div>
		<!-- End H1 Title -->
		<!-- Start Main Body Wrap -->
		<div id="main-wrap">

			<!-- Start Left Section -->
			<div class="leftsection">

				<!-- Start Blog Post -->
				<div class="blogwrapstart">
					<div class="blogtitle">
						<h3>Course Details</h3>
					</div>

					<div class="blogbody">
						<!-- Start Blog Text -->
						<div class="blogtext">
							<%
								String course_id = null;
							String course_name = null;
								if (request.getAttribute("course_details") != null) {
							%>
							<%
								JsonObject details = (JsonObject) request
											.getAttribute("course_details");
							course_id = details.get("c_id").getAsString();
							course_name = details.get("name").getAsString();
							%>
							<p>
								<b class="settingsicon">Name:</b>
								<%=details.get("name").getAsString()%>
								<b class="settingsicon">Course ID:</b>
								<%=details.get("c_id").getAsString()%>

							</p>
							<p>
								<b class="settingsicon">Department: </b><%=details.get("dept").getAsString()%>
								<b class="settingsicon">University: </b><%=details.get("university").getAsString()%>
							</p>
							<p>
								<b class="settingsicon">Professor: </b><%=details.get("professor").getAsString()%>
							</p>
							<p>
								<b class="settingsicon"> Demo Video Link: </b><a
									href="<%=details.get("demo_video_link").getAsString()%>"><%=details.get("demo_video_link").getAsString()%>
								</a>
							</p>
							<p>
								<b class="settingsicon">Related Document Link: </b><a
									href="<%=details.get("related_doc_link").getAsString()%>"><%=details.get("related_doc_link").getAsString()%>
								</a>
							</p>
							<p>
								<b class="settingsicon">Description: </b>
								<%=details.get("description").getAsString()%>
							</p>

							<b class="settingsicon">Overall Ratings: </b><%=details.get("overall_rating").getAsString()%>

							<form id="ratingsForm">
								<div class="stars">
									<%
										if ((details.get("overall_rating").getAsFloat()) == 5
													&& details.get("overall_rating").getAsFloat() >= 4.5) {
									%>
									<input type="radio" name="star" class="star-1" id="star-1" />
									<label class="star-1" for="star-1">1</label> <input
										type="radio" name="star" class="star-2" id="star-2" /> <label
										class="star-2" for="star-2">2</label> <input type="radio"
										name="star" class="star-3" id="star-3" /> <label
										class="star-3" for="star-3">3</label> <input type="radio"
										name="star" class="star-4" id="star-4" /> <label
										class="star-4" for="star-4">4</label> <input type="radio"
										name="star" class="star-5" id="star-5" checked /> <label
										class="star-5" for="star-5">5</label> <span></span>
									<%
										} else if (details.get("overall_rating").getAsFloat() < 4.5
													&& details.get("overall_rating").getAsFloat() >= 3.5) {
									%>
									<input type="radio" name="star" class="star-1" id="star-1" />
									<label class="star-1" for="star-1">1</label> <input
										type="radio" name="star" class="star-2" id="star-2" /> <label
										class="star-2" for="star-2">2</label> <input type="radio"
										name="star" class="star-3" id="star-3" /> <label
										class="star-3" for="star-3">3</label> <input type="radio"
										name="star" class="star-4" id="star-4" checked /> <label
										class="star-4" for="star-4">4</label> <input type="radio"
										name="star" class="star-5" id="star-5" /> <label
										class="star-5" for="star-5">5</label> <span></span>
									<%
										} else if (details.get("overall_rating").getAsFloat() < 3.5
													&& details.get("overall_rating").getAsFloat() >= 2.5) {
									%>
									<input type="radio" name="star" class="star-1" id="star-1" />
									<label class="star-1" for="star-1">1</label> <input
										type="radio" name="star" class="star-2" id="star-2" /> <label
										class="star-2" for="star-2">2</label> <input type="radio"
										name="star" class="star-3" id="star-3" checked /> <label
										class="star-3" for="star-3">3</label> <input type="radio"
										name="star" class="star-4" id="star-4" /> <label
										class="star-4" for="star-4">4</label> <input type="radio"
										name="star" class="star-5" id="star-5" /> <label
										class="star-5" for="star-5">5</label> <span></span>
									<%
										} else if (details.get("overall_rating").getAsFloat() < 2.5
													&& details.get("overall_rating").getAsFloat() >= 1.5) {
									%>
									<input type="radio" name="star" class="star-1" id="star-1" />
									<label class="star-1" for="star-1">1</label> <input
										type="radio" name="star" class="star-2" id="star-2" checked />
									<label class="star-2" for="star-2">2</label> <input
										type="radio" name="star" class="star-3" id="star-3" /> <label
										class="star-3" for="star-3">3</label> <input type="radio"
										name="star" class="star-4" id="star-4" /> <label
										class="star-4" for="star-4">4</label> <input type="radio"
										name="star" class="star-5" id="star-5" /> <label
										class="star-5" for="star-5">5</label> <span></span>
									<%
										} else if (details.get("overall_rating").getAsFloat() < 1.5
													&& details.get("overall_rating").getAsFloat() >= 0.5) {
									%>
									<input type="radio" name="star" class="star-1" id="star-1"
										checked /> <label class="star-1" for="star-1">1</label> <input
										type="radio" name="star" class="star-2" id="star-2" /> <label
										class="star-2" for="star-2">2</label> <input type="radio"
										name="star" class="star-3" id="star-3" /> <label
										class="star-3" for="star-3">3</label> <input type="radio"
										name="star" class="star-4" id="star-4" /> <label
										class="star-4" for="star-4">4</label> <input type="radio"
										name="star" class="star-5" id="star-5" /> <label
										class="star-5" for="star-5">5</label> <span></span>
									<%
										} else if (details.get("overall_rating").getAsFloat() < 0.5) {
									%>
									<input type="radio" name="star" class="star-1" id="star-1"
										checked /> <label class="star-1" for="star-1">1</label> <input
										type="radio" name="star" class="star-2" id="star-2" /> <label
										class="star-2" for="star-2">2</label> <input type="radio"
										name="star" class="star-3" id="star-3" /> <label
										class="star-3" for="star-3">3</label> <input type="radio"
										name="star" class="star-4" id="star-4" /> <label
										class="star-4" for="star-4">4</label> <input type="radio"
										name="star" class="star-5" id="star-5" /> <label
										class="star-5" for="star-5">5</label> <span></span>
									<%
										}
									%>
								</div>

							</form>

							<%
								} else {
							%>
							<p>Search by Course Id or Course Name to get all the details,
								Ratings, Latest Comments and Description</p>

							<br> <br> <br>
							<%
								}
							%>


						</div>
						<!-- End Blog Text -->
					</div>

					<span class="box-arrow"></span>

				</div>
				<!-- End Blog Post -->

				<!-- Start Blog Post -->
				<div class="blogwrap">

					<div class="blogcommenttitle">
						<h3>Comments</h3>
					</div>
					<span class="box-arrow"></span>

				</div>
				<!-- End Blog Post -->
				<!-- Start Blog Comments -->
				<div class="blogcomment">


					<%
						if (request.getAttribute("course_comments") != null) {
					%>
					<%
						List<JsonObject> comments = (List<JsonObject>) request.getAttribute("course_comments");
					%>
					
					<%
						System.out.println("size : " + comments.size());
					%>
					<%
						for (int i = 0; i < comments.size(); i++) {
								JsonObject temp = comments.get(i);
								JsonObject comment = (JsonObject) temp.get("value");
					%>
					
					<div class="blogwcommentwrap">
						<div class="commenttitle">
							<p>
								<span class="avatarname"><%=comment.get("user_name")%></span> <span
									class="avatardate">On: <span class="avatardateorange"><%=comment.get("date")%></span></span>
								<span class="avatarreply"><a href="#" title="reply">Ratings
										<%=comment.get("user_rating")%></a></span>
							</p>

						</div>
						<div class="commentuser">
							<img src="images/avatar.jpg" alt="John Doe">
						</div>

						<div class="commenttext">


							<p><%=comment.get("comment")%></p>

						</div>

						<span class="box-arrow"></span>

					</div>
					
					<% } %>
					<% } else { %>
					<p> There are no comments to display</p>
					<%	}%>

				</div>
				<!-- End Blog Comments -->
			</div>
			<!-- End Left Section -->

			<!-- Start Right Section -->
        <div class="rightsection">
        
        	<!-- Start Blog Widget -->
            <div class="blogwidgetstart">
            	<!-- Start Advertising Widget -->
            	<div class="widgettitle"><h4>Advertising</h4></div>
                
                <div class="widgetbody">
                
                	<div class="blogadvertising">
                    
                    <a href="#"><img src="images/advertising/themeadvertising.jpg"  alt="Themeforest"></a>
                    <a href="#"><img src="images/advertising/audioadvertising.jpg" alt="Audiojungle"></a>
                    <a href="#"><img src="images/advertising/graphicadvertising.jpg" alt="Grahpicrive"></a>
                    <a href="#"><img src="images/advertising/tutorialadvertising.jpg" alt="Tutsplus"></a>
                    
                    </div>
                
              </div>
              <!-- End Advertising Widget -->
              <span class="box-arrow"></span>
            
            </div>
            <!-- End Blog Widget -->
            
        	<!-- Start Blog Widget -->
            <div class="blogwidget">
            	<!-- Start Categories Widget -->
            	<div class="widgettitle"><h4>Blog Categories</h4></div>
                
                <div class="widgetbody">
                
                	<div class="blogcategories">
                    
                    	<ul>
                        	<li><a href="#" title="All Blogs">All Blogs</a></li>
                            <li><a href="#" title="All Blogs">Lorem ipsum dolor sit</a></li>
                            <li><a href="#" title="All Blogs">Maecenas non ipsum </a></li>
                            <li><a href="#" title="All Blogs">Lorem ipsum dolor sit</a></li>
                            <li><a href="#" title="All Blogs">Maecenas non ipsum </a></li>
                            <li><a href="#" title="All Blogs">Lorem ipsum dolor sit</a></li>
                            <li><a href="#" title="All Blogs">Maecenas non ipsum </a></li>
                            <li><a href="#" title="All Blogs">Lorem ipsum dolor sit</a></li>
                            <li><a href="#" title="All Blogs">Maecenas non ipsum </a></li>
                            <li><a href="#" title="All Blogs">Lorem ipsum dolor sit</a></li>
                            <li><a href="#" title="All Blogs">Maecenas non ipsum </a></li>
                            <li><a href="#" title="All Blogs">Lorem ipsum dolor sit</a></li>
                            <li><a href="#" title="All Blogs">Maecenas non ipsum </a></li>                            
                        </ul>
                    
                    </div>
                
              </div>
              <!-- End Categories Widget -->
              <span class="box-arrow"></span>
            
            </div>
            <!-- End Blog Widget -->
            
        	<!-- Start Blog Widget -->
            <div class="blogwidget">
            	<!-- Start Categories Widget -->
            	<div class="widgettitle"><h4>Top 5 Blog Posts</h4></div>
                
                <div class="widgetbody">
                
                	<div class="blogcategories">
                    
                    	<ul>
                        	<li><a href="#" title="All Blogs">Maecenas non ipsum nunc</a></li>
                            <li><a href="#" title="All Blogs">Lorem ipsum dolor </a></li>
                            <li><a href="#" title="All Blogs">Maecenas non ipsum </a></li>
                            <li><a href="#" title="All Blogs">Lorem ipsum dolor sit</a></li>
                            <li><a href="#" title="All Blogs">Maecenas non ipsum nunc</a></li>                        
                        </ul>
                    
                    </div>
                
              </div>
              <!-- End Categories Widget -->
              <span class="box-arrow"></span>
            
            </div>
            <!-- End Blog Widget -->
        
        </div>
        <!-- End Right Section -->
    			
			<!-- Start Full Width -->
				<div class="boxes-full">

					<div class="contacttitle">

						<h2>Comment</h2>

					</div>

					<div class="boxes-padding fullpadding">

						<div id="contactwarning"></div>
						<div id="contactajax"></div>

						<form:form action="${pageContext.request.contextPath}/insert_comment" method="post" modelAttribute="comment_detail">
							<div class="contacttextarea">
								<form:input type="hidden" path="course_id" id="course_id" name="course_id" value="<%=course_id %>" class="contacttextform" />
								<form:input type="hidden" path="course_name" id="course_id" name="course_name" value="<%=course_name %>" class="contacttextform" />
								
                    			<div align="left" style="color: black">	<b>Full Name* :</b></div>
								<form:input path="commenter_name" id="name" name="name"	type="text" class="contacttextform" />

								<div align="left" style="color: black"><b>Email* :</b></div>
								<form:input path="commenter_email" id="name" name="email" type="text" class="contacttextform" />
								<br>
								<div align="left" style="color: black"><b>You Are? :</b></div>
								<form:radiobuttons path="type_of_user" items="${user_type}" onclick="showhidediv(this);" style="xcolor :black;"/>
								<%-- <form:select path="rating" name="rating" style="width: 355px;">
									<c:forEach items="${user_type}" var="item">
										<option value="${item}" style="font-family:arial">${item}</option>
									</c:forEach>
								</form:select> --%>
								

								<div id="one" class="CF" >
								<div class="accordionwrap">
                        
		                            <div class="accordiontitle"><a href="#">Enrolled Students</a></div>
		                            <div class="accordioncontent">
									
									<div align="left" style="color: black">	<b>How do you rate the content of the Course relevent to Industry?</b></div>
									<form:radiobuttons path="content_rating" items="${stars}" />
									
									<div align="left" style="color: black">	<b>How far does the Course help you in future endevours?</b></div>
									<form:radiobuttons path="technology_rating" items="${stars}" />
									
									<div align="left" style="color: black">	<b>Your Overall Experience! Would you recommend this course to other?</b></div>
									<form:radiobuttons path="overall_rating" items="${stars}" />
									
									</div>
								</div>
									
								</div>
								<div id="two" style="display:none;" class="CF" >
								<div class="accordionwrap">
                        
		                            <div class="accordiontitle"><a href="#">Unenrolled Student</a></div>
		                            <div class="accordioncontent">
									
									<div align="left" style="color: black">	<b>How do you find the content of the course interesting?</b></div>
									<form:radiobuttons path="content_rating" items="${stars}" />
									
									<div align="left" style="color: black">	<b>Does the technology help gain jobs?</b></div>
									<form:radiobuttons path="technology_rating" items="${stars}" />
									
									<div align="left" style="color: black">	<b>Overall Ratings!</b></div>
									<form:radiobuttons path="overall_rating" items="${stars}" />
									
									</div>
								</div>
								</div>
								<div id="three" style="display:none;" class="CF" >
								<div class="accordionwrap">
                        
		                            <div class="accordiontitle"><a href="#">Industrialist</a></div>
		                            <div class="accordioncontent">
									
									<div align="left" style="color: black">	<b>Does the course structure match your company requirements?</b></div>
									<form:radiobuttons path="content_rating" items="${stars}" />
									
									<div align="left" style="color: black">	<b>How do you rate the overall future of this technology?</b></div>
									<form:radiobuttons path="technology_rating" items="${stars}" />
									
									<div align="left" style="color: black">	<b>Overall Ratings!</b></div>
									<form:radiobuttons path="overall_rating" items="${stars}" />
									
									</div>
								</div>
								</div>
								
								<br><br><br>
							         <div align="left"> <b>Comments* :</b></div> <form:textarea path="comment" name="comment" id="comment" cols="3" rows="5" class="contacttextform" />
							
								
								<br> <font color="red">Asterisk (*) marked fields are mandatory.</font>
								<fieldset>
									<br>
								</fieldset>
								<fieldset>
									<input name="Submit" type="submit" class="contactformbutton" value="Submit">
								</fieldset>
							</div>
							<div class="contacttextboxes">
							<h3>Accordian Section</h3>
                        
                        <!-- Start Accordian -->
                        <div class="accordionwrap">
                        
                            <div class="accordiontitle"><a href="#">Accordian Title 1</a></div>
                            <div class="accordioncontent">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>
                            </div>
                        
                            <div class="accordiontitle"><a href="#">Accordian Title 2</a></div>
                            <div class="accordioncontent">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>
                            </div>
                        
                            <div class="accordiontitle"><a href="#">Accordian Title 3</a></div>
                            <div class="accordioncontent">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>
                            </div>
                            <div class="accordiontitle"><a href="#">Accordian Title 4</a></div>
                            <div class="accordioncontent">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>
                            </div>
                        
                        </div>
                        <!-- End Accordian -->
                
							</div>
					
						</form:form>

					</div>

					<span class="box-arrow"></span>

				</div>
				<!-- End Full Width -->
		</div>
				<!-- End Main Body Wrap -->
		
	</div>
	<!-- Start Footer -->
	<div id="footer">
		<!-- Start Footer Top -->
		<div id="footertop">

			<div class="footerwrap">
				<!-- Start Latest Tweets -->
				<div id="latest-tweets">
					<div id="twittertitle">Latest Tweets</div>
					<div id="twitterbody"></div>
				</div>
				<!-- End Latest Tweets -->
				<!-- Start Useful Links -->
				<div id="useful_links">
					<div id="usefultitle">Latest Tweets</div>
					<div id="usefulbody">

						<ul>

							<li><a href="#" title="">Lorem ipsum dolor sit </a></li>
							<li><a href="#" title="">Maecenas non ipsum nunc</a></li>
							<li><a href="#" title="">Lorem ipsum dolor </a></li>
							<li><a href="#" title="">Maecenas non ipsum </a></li>
							<li><a href="#" title="">Lorem ipsum dolor sit </a></li>
							<li><a href="#" title="">Maecenas non ipsum nunc</a></li>
							<li><a href="#" title="">Lorem ipsum dolor </a></li>
							<li><a href="#" title="">Maecenas non ipsum </a></li>
							<li><a href="#" title="">Lorem ipsum dolor sit </a></li>
							<li><a href="#" title="">Maecenas non ipsum nunc</a></li>

						</ul>

					</div>
				</div>
				<!-- End Useful Links -->
				<!-- Start Testimonials -->
				<div id="latest-testimonial">
					<div id="testimonialtitle">Latest Testimonials</div>
					<div id="testimonialbody">
						<!-- Starting simple slider -->
						<div id="simpleslider">
							<!-- Slide 1 -->
							<div class="current">
								<h6>Title 1</h6>
								<p>Lorem ipsum dolor sit amet, consectetur elit. Maecenas
									non ipsum nunc, nec sagittis tellus. Lorem ipsum dolor sit
									amet, consectetur elit. Maecenas non ipsum nunc</p>
							</div>
							<!-- End Slide 1 -->
							<!-- Slide 2 -->
							<div>
								<h6>iusdhfisd sdf</h6>
								<p>Lorem ipsum dolor sit amet, consectetur elit. Maecenas
									non ipsum nunc, nec sagittis tellus. Lorem ipsum dolor sit
									amet, consectetur elit. Maecenas non ipsum nunc</p>
							</div>
							<!-- End Slide 2 -->
							<!-- Slide 3 -->
							<div>
								<h6>eco sodalirity ltd</h6>
								<p>Lorem ipsum dolor sit amet, consectetur elit. Maecenas
									non ipsum nunc, nec sagittis tellus. Lorem ipsum dolor sit
									amet, consectetur elit. Maecenas non ipsum nunc</p>
							</div>
							<!-- End Slide 3 -->
							<!-- Slide 4 -->
							<div>
								<h6>asd</h6>
								<p>Lorem ipsum dolor sit amet, consectetur elit. Maecenas
									non ipsum nunc, nec sagittis tellus. Lorem ipsum dolor sit
									amet, consectetur elit. Maecenas non ipsum nunc</p>
							</div>
							<!-- End Slide 4 -->
							<!-- Slide 5 -->
							<div>
								<h6>ec234234234</h6>
								<p>Lorem ipsum dolor sit amet, consectetur elit. Maecenas
									non ipsum nunc, nec sagittis tellus. Lorem ipsum dolor sit
									amet, consectetur elit. Maecenas non ipsum nunc</p>
							</div>
							<!-- End Slide 5 -->
						</div>
						<!-- Ending simple slider -->
						<div class="speachlower"></div>
					</div>
				</div>
				<!-- End Latest Testimonials -->
			</div>

		</div>
		<!-- End Footer Top -->
		<div class="clear"></div>
		<!-- Start Footer Bottom -->
		<%@include file="includes/footer_bottom.jsp"%>
		<!-- End Footer Bottom -->

	</div>
	<!-- End Footer -->
	<!-- Start Scroll To Top Div -->
	<div id="scrolltab"></div>
	<!-- End Scroll To Top Div -->
</body>
</html>