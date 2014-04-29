<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<title>Registration</title>
<meta name="description" content="Response Premium Html Responsive Template - Blog Section" />
<meta name="keywords" content="Responsive Html, Responsive Template, Response, Free Icons, List Section" />
<meta name="apple-mobile-web-app-capable" content="yes" /> 
<meta name="apple-mobile-web-app-status-bar-style" content="grey" /> 
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;" /> 
<link rel="shortcut icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link rel="bookmark icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link href="<c:url value="/css/main.css" />" rel="stylesheet" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="js/jquery.nivo.slider.js" />"></script>
<script src="<c:url value="js/twitter.js" />" /></script>    
<script src="<c:url value="js/custom.js" />">   
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
</head>

<body>
<div id="header">
<%@include file="includes/menu.jsp" %>
<div class="clear"></div>
        <!-- Start Social & Logo area -->
<%@include file="includes/social.jsp" %>     
</div>

<div id="main">
    <!-- Start H1 Title -->
    <div class="titlesnormal">
    
    	<h1>Registration Page</h1>
        
        <span></span>
    
    </div>
    <!-- End H1 Title -->
    <!-- Start Main Body Wrap -->
    <div id="main-wrap">
        
        <!-- Start Left Section -->
        <div class="leftsection">
        
        	<!-- Start Blog Post -->
        	<div class="blogwrapstart">
            
            	<div class="blogtitle"><h3><a href="blog-post.html" title="5 ways to get top of google">Enter your personal details.</a></h3></div>
                
                <div class="blogbody">
                	<div class="blogtext">
                	
                    <form:form method="post" action="${pageContext.request.contextPath}/insert" modelAttribute="user">
                    	<p>
						User ID: <form:input path="userId" /><br><br><br>
						First Name: <form:input path="firstName" /><br><br><br>
						Last Name: <form:input path="lastName" /><br><br><br>
						Gender: <form:input path="gender" /><br><br><br>
						City: <form:input path="city" /><br><br><br>
						<input type="submit" value ="Register"/>
						</p>
					</form:form>	
					
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
                    
                    <div class="commentuser"><img src="<c:url value="images/avatar.jpg" />" alt="John Doe"></div>
                    
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
            	<div class="widgettitle"><h4>Advertising</h4></div>
                
                <div class="widgetbody">
                
                	<div class="blogadvertising">
                    
                    <a href="#"><img src="<c:url value="images/advertising/themeadvertising.jpg" />" alt="Themeforest"></a>
                    <a href="#"><img src="<c:url value="images/advertising/audioadvertising.jpg" />" alt="Audiojungle"></a>
                    <a href="#"><img src="<c:url value="images/advertising/graphicadvertising.jpg" />" alt="Grahpicrive"></a>
                    <a href="#"><img src="<c:url value="images/advertising/tutorialadvertising.jpg" />" alt="Tutsplus"></a>
                    
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