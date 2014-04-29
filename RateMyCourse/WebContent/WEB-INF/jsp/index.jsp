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
</script> 
<script type="text/javascript" charset="utf-8">
  $(document).ready(function(){
    $("a[rel^='prettyPhoto']").prettyPhoto();
  });
</script>

</head>

<body>
<div id="header">
<%@include file="includes/menu.jsp" %>
<div id="header_small">
        	<!-- Start Social area -->
            	<form action="#" method="post" id="search-form">
 <span id="search-page-border">
 <label class="accessibly-hidden">Search for:</label>  <input type="text" class="search-terms" name="search-terms" onfocus="if(this.value == 'Search...') { this.value = ''; }" onblur="if(this.value == '') { this.value = 'Search...'; }" value="Search..." />
 <label for="search-which" class="accessibly-hidden">Search these:</label><select name="search-which" id="search-which" style="width: auto"><option value="members">Members</option><option value="groups">Groups</option><option value="forums">Forums</option><option value="posts">Posts</option></select> </span>
 <input type="submit" name="search-submit" id="search-submit" value="Search" />
</form>


            </div>
            <!-- End Logo area -->
                <div class="clear"></div>
	
        <!-- End Social & Logo area -->

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
    
    	<h1>Welcome to Rate My Course Website ${message }</h1>
        
        <span></span>
    
    </div>
    <!-- End H1 Title -->
    <!-- Start Main Body Wrap -->
    <div id="main-wrap">
    
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
<!-- Start Footer -->
<div id="footer">
	<!-- Start Footer Top -->
	<div id="footertop">
    
    	<div class="footerwrap">
    		<!-- Start Latest Tweets -->
            <div id="latest-tweets">
                <div id="twittertitle">Latest Tweets</div>
                <div id="twitterbody">
                
                </div>
            </div>
            <!-- End Latest Tweets -->
    		<!-- Start Useful Links -->
            <div id="useful_links">
                <div id="usefultitle">Navigate</div>
                <div id="usefulbody">
               		<ul>
                    
                    	<li><a href="#" title="">About</a></li>
                        <li><a href="#" title="">Most Rated Course</a></li>
                        <li><a href="#" title="">Most Followed Course</a></li>
                        <li><a href="#" title="">Industry Oriented Course</a></li>
                        <li><a href="#" title="">Top Courses by College</a></li>
                                         
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