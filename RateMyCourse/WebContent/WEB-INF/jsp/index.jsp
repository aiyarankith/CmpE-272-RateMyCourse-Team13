<!DOCTYPE HTML>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.lang.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
<meta charset="utf-8">
<title>Rate My Course</title>
<meta name="description" content="Response Premium Html Responsive Template" />
<meta name="keywords" content="Responsive Html, Responsive Template, Response" />
<link rel="shortcut icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link rel="bookmark icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link href="<c:url value="/css/main.css" />" rel="stylesheet" type="text/css">
<meta name="apple-mobile-web-app-capable" content="yes" /> 
<meta name="apple-mobile-web-app-status-bar-style" content="grey" /> 
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="js/jquery.nivo.slider.js" />"></script>
<script src="<c:url value="js/jquery.prettyPhoto.js" />" type="text/javascript"></script>
<script src="<c:url value="js/twitter.js" />" /></script>    
<script src="<c:url value="js/custom.js" />"></script>
<script>
	//// Start Simple Sliders ////
	$(function() {
		setInterval("rotateDiv()", 5000);
	});
		
		function rotateDiv() {
		var currentDiv=$("#simpleslider div.current");
		var nextDiv= currentDiv.next ();
		if (nextDiv.length ==0)
			nextDiv=$("#simpleslider div:first");
		
		currentDiv.removeClass('current').addClass('previous').fadeOut('2000');
		nextDiv.fadeIn('3000').addClass('current',function() {
			currentDiv.fadeOut('2000', function () {currentDiv.removeClass('previous');});
		});
	
	}
	//// End Simple Sliders //// 
	setTimeout(function() {
  $("#message").remove();
}, 5000);
</script> 

<script type="text/javascript" charset="utf-8">
  $(document).ready(function(){
    $("a[rel^='prettyPhoto']").prettyPhoto();
    $('#searchForm').submit(
    		
			function parseResponse() {
		
				var value = $("#value");
				var unWantedStringRegEx = new RegExp();
				var valid = unWantedStringRegEx.test(value.val());
				 
				if(!valid) {
					$("#warningBox").html('<p class="rejectionalert"><span>Special charecters not allowed</span></p>').slideDown().delay(2000).slideUp();
					$('input[type=submit]', $("#searchForm")).removeAttr('disabled');
					return false;
				}
				
				if (value.val() == "") {				  
					$("#warningBox").html('<p class="rejectionalert"><span>Enter something to search</span></p>').slideDown().delay(2000).slideUp();
					$('input[type=submit]', $("#searchForm")).removeAttr('disabled');
					return false;			   
				}
			  }
		  );
  });
</script>

</head>

<body>
<div id="header">
<%@include file="includes/menu.jsp" %>

<div class="clear"></div>
<%@include file="includes/social.jsp" %>
<div id="header_small" style="width:800px; margin:0 auto;">
       
	
	
	</div>
</div>


<div id="main">


    <!-- Start Slider Wrapping -->
    <div id="sliderwrap">
		
        <!-- Start Slider -->
        <div id="slider" class="nivoSlider">
            <img src="images/slider-banners/slider01.jpg" alt=""/>
            <img src="images/slider-banners/slider02.jpg" alt=""/>
            <img src="images/slider-banners/slider03.jpg" alt=""/>
        </div>
        <!-- End Slider -->
        
        <!-- Start Slider HTML Captions -->
        <div id="htmlcaption" class="nivo-html-caption">
            <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>.
        </div>
        <!-- End Slider HTML Captions -->
    
    </div>
    <!-- End Slider Wrapping -->

    
    <!-- Start H1 Title -->
    <div class="titles">
    
    	<h1>Welcome to Rate My Course Website</h1>
        
        <span></span>
    
    </div>
    <!-- End H1 Title -->
    <!-- Start Main Body Wrap -->
    <div id="main-wrap">
    <div class="boxes-full">
    	<div class="boxes-padding fullpadding">
    	   	<c:if test = "${confirmation_message !=null}" >
    	        <p class="greenalert" id="message"><span>${confirmation_message}</span></p>
    		</c:if>
    		<c:if test = "${unauth_access !=null}" >
    	        <p class="rejectionalert" id="message"><span>${unauth_access}</span></p>
    		</c:if>
        	<div class="split3">
                
                    <h3>Rate My Course</h3>
                    <hr />
                    <p>&diams; Search for the Courses by Name</p>
                    <p>&diams; Search for the Courses by Course ID</p>
                    <p>&diams; Search for the Courses by Content</p>
                    
                
                </div>
                
                <div class="split23">
                
                    <h3>Search For the Courses</h3><hr />
                    <br>
                    <h4>&#9733; Rate &#9733; Comment &#9733; Browse </h4>
                    <br>
                    <form action="${pageContext.request.contextPath}/search" method="post" name="searchForm">
		<span id="search-page-border">
		 <select class="search-terms" name="searchCategory" id="searchCategory" style="width: auto" data-selected="CNAME">
		 	<option value="CNAME">Course Name</option>
		 	<option value="CID">Course ID</option>
		 	<option value="CDESC">Course Content</option>
		 </select>
		 <label class="accessibly-hidden">Search for:</label>
		 <input type="text" class="search-terms" name="searchValue" onfocus="if(this.value == 'Search...') { this.value = ''; }" onblur="if(this.value == '') { this.value = 'Search...'; }" placeholder="Search..." />
		 <label for="search-which" class="accessibly-hidden">Search these:</label>
		</span>
		<input type="submit" name="search-submit" id="search-submit" value="Search" />
	</form>
                </div>
        </div>
    </div>
    	<!-- Start Featured Boxes -->
        <div class="boxes-third boxes-first">
        
        	<div class="boxes-padding">
            
            	<div class="bti">
                	<div class="featured-images"><img src="images/responsive-icon.png" width="72" height="53" alt="Responsive"></div>
                	<div class="featured-titles">Course Content</div>
                </div>
                <div class="featured-text">Get to know all the hot courses in California State University as per its industry relevence.</div>
            
            </div>
            
            <span class="box-arrow"></span>
        
        </div>
        
        <div class="boxes-third">
        
        	<div class="boxes-padding">
            
            	<div class="bti">
                    <div class="featured-images"><img src="images/cleansleek-icon.png" width="66" height="53" alt="Responsive"></div>
                    <div class="featured-titles">Rate Courses</div>
                </div>
                <div class="featured-text">Rate the courses you know and add appropriate comments and suggestions. Ratings differ from person's occupation.</div>
            
            </div>
            
            <span class="box-arrow"></span>
        
        </div>
        
        <div class="boxes-third boxes-last">
        
        	<div class="boxes-padding">
            	
                <div class="bti">
                    <div class="featured-images"><img src="images/google-icon.png" width="54" height="53" alt="Responsive"></div>
                    <div class="featured-titles">Search Courses</div>
                </div>
                <div class="featured-text">You can also search for the courses you know and check out the reviews and ratings.</div>
            
            </div>
            
            <span class="box-arrow"></span>
        
        </div>
        <!-- End Featured Boxes -->
        
       
</div>
</div>
<!-- Start Footer -->
<div id="footer">
	<!-- Start Footer Top -->
	<div id="footertop">
    
    	<div class="footerwrap">
    		<!-- Start Latest Tweets -->
				<div id="useful_links">
					<div id="usefultitle">Navigation</div>
					<div id="usefulbody">

						<ul>

							<li><a href="index">Home </a></li>
							<li><a href="about">About</a></li>
							<li><a href="most_rated_course">Most Rated Course</a></li>
							<li><a href="most_followed_course">Most Followed Course</a></li>
							<li><a href="industry_oriented_course">Industry Oriented Course</a></li>
							<li><a href="top_courses_colleges">Top Courses By College</a></li>
						</ul>

					</div>
				</div>
				
				<!-- End Latest Tweets -->
    		<!-- Start Useful Links -->
				<div id="useful_links">
					<div id="usefultitle">Help And Support</div>
					<div id="usefulbody">

						<ul>

							<li><a href="user_ticket">Contact Us</a></li>
							<li><a href="about">About</a></li>
							<li><a href="#">What is Rss?</a></li>
							<li><a href="#">FAQ</a></li>

						</ul>

					</div>
				</div>
				<!-- End Useful Links -->
    		<!-- Start Testimonials -->
            <div id="latest-testimonial">
                <div id="testimonialtitle">Latest RSS Feeds</div>
                <div id="testimonialbody">
                	<!-- Starting simple slider -->
                    <div id="simpleslider">
                            <!-- Slide 1 -->
                            <% ArrayList<String> rsslist = (ArrayList <String>) request.getAttribute("RSSList"); 
                			boolean flag = true;
                            %>
                            <% for (int i = 0; i < rsslist.size(); i++) { 
                            %>
                            <% if(flag == true) {%>
	                            <% if (i % 2 != 0) { %>
	                            	<div class="current">
	                                <h6>Feeds</h6>
	                                <p><a href="<%= rsslist.get(i) %>"><%= rsslist.get(i-1) %></a></p>
	                                </div> 
								<% } else { %>
									<div class="current">
	                                <h6>Feeds</h6>
	                                <p><a href="<%= rsslist.get(i+1) %>"><%= rsslist.get(i) %></a></p>
	                                </div> 
	                         	<% } %>
							<% flag = false; %>
                            <% } else { %>
                            	<% if (i % 2 != 0) { %>
	                            	<div>
	                                <h6>Feeds</h6>
	                                <p><a href="<%= rsslist.get(i) %>"><%= rsslist.get(i-1) %></a></p>
	                                </div> 
								<% } else { %>
									<div>
	                                <h6>Feeds</h6>
	                                <p><a href="<%= rsslist.get(i+1) %>"><%= rsslist.get(i) %></a></p>
	                                </div> 
	                         	<% } %>
                  			
                         	
                            <% } %>
                            <% } %>
                
                            <!-- End Slide 1 -->
                            
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
    <%@include file="includes/footer_bottom.jsp" %>
	<!-- End Footer Bottom -->

</div>
<!-- End Footer -->
<!-- Start Scroll To Top Div -->
<div id="scrolltab"></div>
<!-- End Scroll To Top Div -->
</body>
</html>