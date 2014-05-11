<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>About Rate My Course</title>
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
    
</div>

<div id="main">
    <!-- Start H1 Title -->
    <div class="titlesnormal">
    
    	<h1>About Rate My Course</h1>
        
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
                
                	<h3>About</h3>
                    
                    <p>Rate My Course 

Rate My Course is a web application which collects user reviews about the courses offered <br>
at the California State University colleges. The users can be students enrolled in these<br> 
colleges and also people from industry.

</br>
Data from the following CSU colleges have been collected:-<br>
  1.San Jose State University <br>
  2.California State University, Long Beach <br>
  3.California State University, East Bay<br>
  4.Fresno State<br>
  5.California State University, Sacramento<br>
  </br>
 The users can easily rate and comment on the courses. This website can be used by anyone whether 
 they are enrolled in the course or not and also by people from the Industry. 
 It gives privileges to users to rate the courses and also give comments .
 The weightage of the rating will be dependent on the user i.e. the rating of an Industrialist will 
 be of maximum value followed by that of enrolled student and then unenrolled student. This will effect 
 the overall rating of the course.
 This helps in accurate assessment of the course in terms of Industry point of view and from syllabus
 point of view.

The users also have the option of submitting a ticket in case he wants to add his comments about a course 
or request to add a missing course. The feedback form can be submitted and the email is sent directly
to the admin.
 
We have also implemented graphs to summarize the information in an easy to read manner. <br>


  </p>
      </div>
      </div>
      </div>
       <!-- Start Footer --> 

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