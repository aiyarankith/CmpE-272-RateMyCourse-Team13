<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Response Blogging Page</title>
<meta name="description" content="Response Premium Html Responsive Template - Blog Section" />
<meta name="keywords" content="Responsive Html, Responsive Template, Response" />
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
    
    	<h1>Response Blogging Page</h1>
        
        <span></span>
    
    </div>
    <!-- End H1 Title -->
    <!-- Start Main Body Wrap -->
    <div id="main-wrap">
        
        <!-- Start Left Section -->
        <div class="leftsection">
        
        	<!-- Start Blog Post -->
        	<div class="blogwrapstart">
            
            	<div class="blogtitle"><h3><a href="blog-post.html" title="5 ways to get top of google">5 ways to get top of google</a></h3></div>
                
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
                    
                    	<p>Lorem ipsum dolor sit amet, consectetur elit. Maecenas non ipsum nunc, nec sagittis tellus Maecenas non ipsum nunc, nec sagittis tellus.Lorem ipsum dolor sit amet, consectetur elit. Maecenas 
non ipsum nunc, nec sagittis tellus Maecenas non ipsum nunc, nec sagittis tellus.</p>

						<p class="blogbutton"><a href="blog-post.html" title="Read More" class="smallsmoothrectange orangebutton">Read More</a></p>
                    
                    </div>
                	<!-- End Blog Text -->
                </div>
                
                <span class="box-arrow"></span>
            
            </div>
            <!-- End Blog Post -->
            
        	<!-- Start Blog Post -->
        	<div class="blogwrap">
            
            	<div class="blogtitle"><h3><a href="blog-post.html" title="5 ways to make your code cleaner">5 ways to make your code cleaner</a></h3></div>
                
                <div class="blogbody">
                	<!-- Start Blog Image -->
                	<div class="blogimage"><a href="blog-post.html"><img src="images/5code.jpg" alt="5 ways to make your code cleaner"></a></div>
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
                    
                    	<p>Lorem ipsum dolor sit amet, consectetur elit. Maecenas non ipsum nunc, nec sagittis tellus Maecenas non ipsum nunc, nec sagittis tellus.Lorem ipsum dolor sit amet, consectetur elit. Maecenas 
non ipsum nunc, nec sagittis tellus Maecenas non ipsum nunc, nec sagittis tellus.</p>
						
                        <p class="blogbutton"><a href="blog-post.html" title="Read More" class="smallsmoothrectange orangebutton">Read More</a></p>
                    
                    </div>
                	<!-- End Blog Text -->
                </div>
                
                <span class="box-arrow"></span>
            
            </div>
            <!-- End Blog Post -->
            
        	<!-- Start Blog Post -->
        	<div class="blogwrap">
            
            	<div class="blogtitle"><h3><a href="blog-post.html" title="how to sell on themeforest">how to sell on themeforest</a></h3></div>
                
                <div class="blogbody">
                	<!-- Start Blog Image -->
                	<div class="blogimage"><a href="blog-post.html"><img src="images/selltheme.jpg" alt="how to sell on themeforest"></a></div>
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
                    
                    	<p>Lorem ipsum dolor sit amet, consectetur elit. Maecenas non ipsum nunc, nec sagittis tellus Maecenas non ipsum nunc, nec sagittis tellus.Lorem ipsum dolor sit amet, consectetur elit. Maecenas 
non ipsum nunc, nec sagittis tellus Maecenas non ipsum nunc, nec sagittis tellus.</p>

						<p class="blogbutton"><a href="blog-post.html" title="Read More" class="smallsmoothrectange orangebutton">Read More</a></p>
                    
                    </div>
                	<!-- End Blog Text -->
                </div>
                
                <span class="box-arrow"></span>
            
            </div>
            <!-- End Blog Post -->
            
            <!-- Start Pagination -->
            <div class="blogwrap">
            
                <div class="blogpagination">
                
                    <ul>
                        <li><a href="#" title="Start" class="normal">Start</a></li>
                        <li><a href="#" title="Previous" class="normal">&lt;Prev</a></li>
                        <li><a href="#" title="1" class="normal">1</a></li>
                        <li><a href="#" title="2" class="normal">2</a></li>
                        <li><a href="#" title="3" class="normal">3</a></li>
                        <li><a href="#" title="4" class="normal">4</a></li>
                        <li><a href="#" title="5" class="normalactive">5</a></li>
                        <li><a href="#" title="6" class="normal">6</a></li>
                        <li><a href="#" title="7" class="normal">7</a></li>
                        <li><a href="#" title="8" class="normal">8</a></li>
                        <li><a href="#" title="9" class="normal">9</a></li>
                        <li><a href="#" title="10" class="normal">10</a></li>
                        <li><a href="#" title="Next" class="normal">Next&gt;</a></li>
                        <li><a href="#" title="Last" class="normal">Last</a></li>
                    </ul>
                
                </div>  
                
                <span class="box-arrow"></span>
            </div> 
            <!-- End Pagination -->
        
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