<!DOCTYPE HTML>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html>
<head>
<meta charset="utf-8">
<title>Add Course</title>
<meta name="description" content="Response Premium Html Responsive Template - Contact Page" />
<meta name="keywords" content="Responsive Html, Responsive Template, Response, Free Icons, List Section" />
<meta name="apple-mobile-web-app-capable" content="yes" /> 
<meta name="apple-mobile-web-app-status-bar-style" content="grey" /> 
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;" /> 
<link rel="shortcut icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link rel="bookmark icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link href="<c:url value="css/main.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" />"></script>
<script type="text/javascript" src="<c:url value="js/jquery.nivo.slider.js" />"></script>
<script type="text/javascript" src="<c:url value="http://maps.google.com/maps/api/js?sensor=true" />"></script>
<script src="<c:url value="js/twitter.js" />"></script>    
<script src="<c:url value="js/custom.js" />"></script>
<script src="<c:url value="js/google.map.js" />"></script>   
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

$(document).ready(function() {
//// Start Contact Form ////
	$('#ajaxcontactform').submit(function(){$('input[type=submit]', this).attr('disabled', 'disabled');});
	
	
	$('#ajaxcontactform').submit(
	
		function parseResponse() {
	
			var usersname = $("#name");
			var usersemail = $("#email");
			var courseno = $("#c_id");
			var dept = $("#dept");
			var description = $("#description");
			var university = $("#university");
			var hidden = $("#hidden");

			//var contactformid = $("#contactformid");
			
			
				var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
				var valid = emailReg.test(usersemail.val());
			 
				if(!valid) {
					$("#contactwarning").html('<p class="rejectionalert"><span>Your email is not valid!</span></p>').slideDown().delay(2000).slideUp();
					$('input[type=submit]', $("#ajaxcontactform")).removeAttr('disabled');
					return false;
				}
			
			  if (usersname.val() == "" || usersname.val() == "Please Insert Course Name*") {				  
				   $("#contactwarning").html('<p class="rejectionalert"><span>Please Insert Course Name!</span></p>').slideDown().delay(2000).slideUp();
				   $('input[type=submit]', $("#ajaxcontactform")).removeAttr('disabled');
				   return false;			   
			  }
			  if (usersemail.val() == "" || usersemail.val() == "Please Insert Your Email*") {
				   $("#contactwarning").html('<p class="rejectionalert"><span>Please Insert Your Email!</span></p>').slideDown().delay(2000).slideUp();
				   $('input[type=submit]', $("#ajaxcontactform")).removeAttr('disabled');
				   return false;
			  }
			  if (courseno.val() == "" || courseno.val() == "Please Insert Course Number/ID*") {
				   $("#contactwarning").html('<p class="rejectionalert"><span>Please Insert Course Number/ID!</span></p>').slideDown().delay(2000).slideUp();
				   $('input[type=submit]', $("#ajaxcontactform")).removeAttr('disabled');
				   return false;
			  }
			  if (university.val() == "" || university.val() == "Please Insert University Name*") {
				   $("#contactwarning").html('<p class="rejectionalert"><span>Please Insert University Name!</span></p>').slideDown().delay(2000).slideUp();
				   $('input[type=submit]', $("#ajaxcontactform")).removeAttr('disabled');
				   return false;
			  }
			  if (dept.val() == "" || dept.val() == "Please Insert Department*") {
				   $("#contactwarning").html('<p class="rejectionalert"><span>Please Insert Department!</span></p>').slideDown().delay(2000).slideUp();
				   $('input[type=submit]', $("#ajaxcontactform")).removeAttr('disabled');
				   return false;
			  }
			  if (description.val() == "" || description.val() == "Please Add A Small Description of the Course*") {
				   $("#contactwarning").html('<p class="rejectionalert"><span>Add Description!</span></p>').slideDown().delay(2000).slideUp();
				   $('input[type=submit]', $("#ajaxcontactform")).removeAttr('disabled');
				   return false;
			  }
			 

			  
		  }
	  
	  );
//// End Contact Form ////

 });
</script> 
</head>

<body onload="initialize()">
<div id="header">
<%@include file="includes/menu.jsp" %>
<div class="clear"></div>
        <!-- Start Social & Logo area -->
<%@include file="includes/social.jsp" %>     
</div>

<div id="main">
    <!-- Start H1 Title -->
    <div class="titlesnormal">
    	<% if (session.getAttribute("first_name") != null ){ %>
    	<h1>Welcome <%= session.getAttribute("first_name") %></h1>
    	<% } else {  %>
    	<% } %>
        <span></span>
    
    </div>
    <!-- End H1 Title -->
    <!-- Start Main Body Wrap -->
    <div id="main-wrap">
              
        <!-- Start Full Width -->
        <div class="boxes-full">
        
            <div class="contacttitle">
            
                <h2>Course Details</h2>
            	
            </div>
        
        	<div class="boxes-padding fullpadding">
            
            <div id="contactwarning">    
            	
            </div>
            <div id="contactajax"></div>
            
            <form:form action="${pageContext.request.contextPath}/insert_course" method="post" name="ajaxcontactform" id="ajaxcontactform" modelAttribute="details">
            
            	<div class="contacttextarea">
                
                		 <b> ${message} </b> 
                    	<div align="left"> <b>Description* :</b></div> <form:textarea path="description" name="description" id="description" cols="5" rows="5" class="contacttextarea" />
                    
					<fieldset>
					<br>
					</fieldset>
					
                    	<div align="left"><b>Video Lecture Link :</b></div> <form:input path="demo_video_link" id="demo_video_link" name="demo_video_link" type="text" class="contacttextform"  />
                    
					<fieldset>
					<br>
					</fieldset>
					
                    	<div align="left"><b>Related Document Link :</b></div><form:input path="related_doc_link" id="related_doc_link" name="related_doc_link" type="text" class="contacttextform"  />
                   
                </div>
                
                <div class="contacttextboxes">
                
                	
                    <div align="left" style="color:black"> <b>Course Name* :</b></div><form:input path="name" id="name" name="name" type="text" class="contacttextform"  />
                    
                    <div align="left" style="color:black"> <b>Course ID* :</b></div><form:input path="c_id" id="c_id" name="c_id" type="text" class="contacttextform"  />
					
                    <div align="left" style="color:black"> <b>Course Department* :</b></div>	<form:input path="dept" id="dept" name="dept" type="text" class="contacttextform"  />
                    
                    <div align="left" style="color:black"> <b>Email* :</b></div>	<form:input path="email" id="email" name="email" type="text" class="contacttextform" />
					
             	  	<div align="left" style="color:black"> <b>University* :</b></div><form:input path="university" id="university" name="university" type="text" class="contacttextform" />
				
	                <div align="left" style="color:black"> <b>Professor Name :</b></div><form:input path="professor" id="professor" name="professor" type="text" class="contacttextform" />
					
					
					<font color="red">Asterisk (*) marked fields are mandatory.</font>
                    <fieldset>
					<br>
					</fieldset>
                	<fieldset>
                    	<input name="send" type="submit" class="contactformbutton" value="Send">
                    </fieldset>
               
                </div>
                
            </form:form>
            
            </div>
            
            <span class="box-arrow"></span>
            
        </div>
        <!-- End Full Width -->
        
    </div>
    <!-- End Main Body Wrap -->

</div>
<%@include file="includes/footer.jsp"%>
<!-- Start Scroll To Top Div -->
<div id="scrolltab"></div>
<!-- End Scroll To Top Div -->
</body>
</html>