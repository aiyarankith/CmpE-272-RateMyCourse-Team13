<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Response Columns Area</title>
<meta name="description" content="Response Premium Html Responsive Template - Column Section" />
<meta name="keywords" content="Responsive Html, Responsive Template, Response, Free Icons, List Section" />
<link rel="shortcut icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link rel="bookmark icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link href="css/main.css" rel="stylesheet" type="text/css">
<meta name="apple-mobile-web-app-capable" content="yes" /> 
<meta name="apple-mobile-web-app-status-bar-style" content="grey" /> 
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;" /> 
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
    
    	<h1>Response Columns Area</h1>
        
        <span></span>
    
    </div>
    <!-- End H1 Title -->
    <!-- Start Main Body Wrap -->
    <div id="main-wrap">
        
        <!-- Start Latest Project titles -->
        <div class="boxes-full">
        
        	<div class="boxes-padding fullpadding">
            	
                <!-- Start None Split Section -->
            	<div class="splitnone">
                
                	<h3>Full Width Column</h3>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>
                
                </div>
            	<!-- End None Split Section -->
                <div class="clear"></div>
                <hr />
                <!-- Start 2 Half Split Section -->
                <div class="split2">
                
                    <h3>Half Width Column</h3>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus.</p>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>
                
                </div>
                
                <div class="split2">
                
                    <h3>Half Width Column</h3>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus.</p>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>
                    
                </div>
                <!-- End 2 Half Split Section -->
                <div class="clear"></div>
                <hr />
                <!-- Start Third Split Section -->
            	<div class="split3">
                
                    <h3>3rd Width Column</h3>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus.</p>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>

                </div>
                
            	<div class="split3">
                
                    <h3>3rd Width Column</h3>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus.</p>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>

                </div>
                
            	<div class="split3">
                
                    <h3>3rd Width Column</h3>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus.</p>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>

                </div>
            	<!-- End Third Split Section -->
                <div class="clear"></div>
                <hr />
                <!-- Start one 3rd and two 3rd Split Section -->
                <div class="split3">
                
                    <h3>3rd Width Column</h3>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus.</p>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>
                
                </div>
                
                <div class="split23">
                
                    <h3>Two 3rd's Width Column</h3>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus.</p>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>
                
                </div>
                <!-- End one 3rd and two 3rd Split Section -->
                <div class="clear"></div>
                <hr />
                <!-- Start Quater Split Section -->
            	<div class="split4">
                
                    <h3>Quater Width Column</h3>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus.</p>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>

                </div>
                
                <div class="split4">
                
                    <h3>Quater Width Column</h3>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus.</p>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>

                </div>
                
                <div class="split4">
                
                    <h3>Two 3rd Width Column</h3>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus.</p>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>

                </div>
                
                <div class="split4">
                
                    <h3>Quater Width Column</h3>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus.</p>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla a sapien diam, bibendum tincidunt purus. Morbi feugiat, augue in luctus lobortis, purus ipsum scelerisque metus, vitae posuere mi turpis tristique neque. Morbi at purus urna, sit amet rutrum lectus. Nullam cursus purus vel velit interdum nec laoreet dolor interdum.</p>

                </div>
                <!-- End Quater Split Section -->

            </div>

            <span class="box-arrow"></span>
        
        </div>
        <!-- End Latest Project titles -->
    
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