<!DOCTYPE HTML>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.lang.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="org.json.simple.*"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.parser.ParseException"%>


<html>
<head>
<meta charset="utf-8">
<title>Course Ratings Page</title>
<meta name="description" content="Response Premium Html Responsive Template - Blog Section" />
<meta name="keywords" content="Responsive Html, Responsive Template, Response, Free Icons, List Section" />
<meta name="apple-mobile-web-app-capable" content="yes" /> 
<meta name="apple-mobile-web-app-status-bar-style" content="grey" /> 
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;" /> 
<link rel="shortcut icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link rel="bookmark icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
<script src="js/twitter.js"></script>    
<script src="js/custom.js"></script>   
<script>
	//// Start Simple Sliders ////
	$(function() {
		setInterval("rotateDiv()", 10000);
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

<script>
	var json = JSON.parse(course_details);
	var name = json["name"];

	System.out.println("JSON Name :"+name);
</script>
</head>

<body>
<div id="header">
<%@include file="includes/menu.jsp" %>
<div id="header_small">
       
	<form:form action="get_course" method="post" id="search-form" modelAttribute="course_id">
		 <span id="search-page-border">
		 <label class="accessibly-hidden">Search for:</label>  <form:input path="course_id" type="text" class="search-terms" name="search-terms" onfocus="if(this.value == 'Search...') { this.value = ''; }" onblur="if(this.value == '') { this.value = 'Search...'; }" value="Search..." />
		 <label for="search-which" class="accessibly-hidden">Search these:</label><select name="search-which" id="search-which" style="width: auto"><option value="members">Course ID</option><option value="groups">Course Name</option><option value="forums"></select> </span>
		 <input type="submit" name="search-submit" id="search-submit" value="Search" />
	</form:form>

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
            
            	<div class="blogtitle"><h3>Course Details</h3></div>
                
                <div class="blogbody">
                	<!-- Start Blog Image -->
                	<div class="blogimage"><a href="blog-post.html"><img src="images/5google.jpg" alt="5 Ways to get top of google"></a></div>
                    <!-- End Blog Text -->
                    <!-- Start Blog Information -->
                    <div class="bloginfo">
                    
                   	  <p class="usericon">Posted By: <span>Admin</span></p>
                      <p class="calendericon">On: <span>March 15th 2010</span></p>
                      <p class="settingsicon">Category: <span>Loremipsom</span></p>
                      <p class="tagicon">Tags: <span>SEO, Google</span></p>
                    
                    </div>
                    <!-- End Blog Information -->
                    <!-- Start Blog Text -->
                    <div class="blogtext">
                    ${course_details}
                    
                    <br><br><br>
                    
                    </div>
                	<!-- End Blog Text -->
                </div>
                
                <span class="box-arrow"></span>
            
            </div>
            <!-- End Blog Post -->
            
        	<!-- Start Blog Post -->
        	<div class="blogwrap">
            
            	<div class="blogcommenttitle"><h3>2 Comments</h3></div>
                <span class="box-arrow"></span>
            
            </div>
            <!-- End Blog Post -->
            <!-- Start Blog Comments -->
            <div class="blogcomment">
            
           	  <div class="blogwcommentwrap">
                
                	<div class="commenttitle">
                    
                    	<p><span class="avatarname">John Doe</span> <span class="avatardate">On: <span class="avatardateorange">March 15th 2010</span></span><span class="avatarreply"><a href="#" title="reply">Reply</a></span></p>
                    
                  </div>
                    
                    <div class="commentuser"><img src="images/avatar.jpg" alt="John Doe"></div>
                    
                    <div class="commenttext">
                    
                    <p>Great blog, interesting to read and very helpful, lets hope i am top of google soon!!!!</p>
                    <p>Thanks!!!</p>
                    
                    </div>
                    
                    <span class="box-arrow"></span>
                
                </div>
            
            </div>
            <!-- End Blog Comments -->
            <!-- Start Blog Comment Reply -->
            <div class="blogcomment">
            
                <div class="blogcommentreply">
                
                      <div class="blogwcommentwrap">
                        
                            <div class="commenttitle">
                            
                                <p><span class="avatarname">Admin</span> <span class="avatardate">On: <span class="avatardateorange">March 15th 2010</span></span><span class="avatarreply"><a href="#" title="reply">Reply</a></span></p>
                            
                          </div>
                            
                            <div class="commentuserreply"><img src="images/avatar-reply.jpg" alt="John Doe"></div>
                            
                            <div class="commenttextreply">
                            
                            <p>Thanks, im glad this post helped you and hope you get to number 1 also!!</p>
                            
                            </div>
                            
                            <span class="box-arrow"></span>
                        
                        </div>
                        
                </div>
            
            </div>
            <!-- End Blog Comment Reply -->
            <!-- Start Comment Form -->
            <div class="blogcomment">
            
           	  <div class="blogwcommentwrap2">
              
              	<div class="blogcommentform">
                
                	<form action="#" method="post" enctype="multipart/form-data" name="comment">
                    
                    <fieldset>
                    
                    	<textarea name="comment" cols="5" rows="5"></textarea>
                    
                    </fieldset>
                    
                    <fieldset class="commentbutton_fieldset">
                    
                    	<input name="Submit" type="submit" value="Submit" class="commentbutton">
                    
                    </fieldset>
                    
                    </form>
                
                </div>
              
              	<span class="box-arrow"></span>
              
              </div>
            
            </div>
            <!-- End Comment Form -->
        
        </div>
        <!-- End Left Section -->
        
        <!-- Start Right Section -->
        <div class="rightsection">
        
        	<!-- Start Blog Widget -->
            <div class="blogwidgetstart">
            	<!-- Start Advertising Widget -->
            	
              
            
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
    
    </div>
    <!-- End Main Body Wrap -->

</div>
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
                                <p>Lorem ipsum dolor sit amet, consectetur elit. Maecenas non ipsum nunc, nec sagittis tellus. Lorem ipsum dolor sit amet, consectetur elit. Maecenas non ipsum nunc</p>
                            </div>
                            <!-- End Slide 1 -->
                            <!-- Slide 2 -->
                            <div>
                                <h6>iusdhfisd sdf</h6>
                                <p>Lorem ipsum dolor sit amet, consectetur elit. Maecenas non ipsum nunc, nec sagittis tellus. Lorem ipsum dolor sit amet, consectetur elit. Maecenas non ipsum nunc</p>
                            </div>
                            <!-- End Slide 2 -->
                            <!-- Slide 3 -->
                            <div>
                                <h6>eco sodalirity ltd</h6>
                                <p>Lorem ipsum dolor sit amet, consectetur elit. Maecenas non ipsum nunc, nec sagittis tellus. Lorem ipsum dolor sit amet, consectetur elit. Maecenas non ipsum nunc</p>
                            </div>
                            <!-- End Slide 3 -->
                            <!-- Slide 4 -->
                            <div>
                                <h6>asd</h6>
                                <p>Lorem ipsum dolor sit amet, consectetur elit. Maecenas non ipsum nunc, nec sagittis tellus. Lorem ipsum dolor sit amet, consectetur elit. Maecenas non ipsum nunc</p>
                            </div>
                            <!-- End Slide 4 -->
                            <!-- Slide 5 -->
                            <div>
                                <h6>ec234234234</h6>
                                <p>Lorem ipsum dolor sit amet, consectetur elit. Maecenas non ipsum nunc, nec sagittis tellus. Lorem ipsum dolor sit amet, consectetur elit. Maecenas non ipsum nunc</p>
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
    <%@include file="includes/footer_bottom.jsp" %>
	<!-- End Footer Bottom -->

</div>
<!-- End Footer -->
<!-- Start Scroll To Top Div -->
<div id="scrolltab"></div>
<!-- End Scroll To Top Div -->
</body>
</html>