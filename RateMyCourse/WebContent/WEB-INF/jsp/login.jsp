<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<title>Response Single Blog Post Page</title>
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
<link href="<c:url value="/css/main.css" />" rel="stylesheet"
	type="text/css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<c:url value="js/jquery.nivo.slider.js" />"></script>
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
		<%@include file="includes/menu.jsp"%>
		<div class="clear"></div>
		<!-- Start Social & Logo area -->
	
	</div>

	<div id="main">
		<!-- Start H1 Title -->
		<div class="titlesnormal">

			<h1>Login Page</h1>

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
						<h3>
							<a href="blog-post.html" title="5 ways to get top of google"><div align="left" style="color:orange"><b>Admin Login</b></div></a>
						</h3>
					</div>

					<div class="blogbody">
						<div class="blogtext">

							<form:form method="post" id="loginForm" action="${pageContext.request.contextPath}/fetchdata" modelAttribute="user">
								<p>
									
									<div align="left" style="color:black"><div class="required"><label><b>Email :</b></div></label><form:input class="contacttextform" path="email" placeholder="Email" id="email" /> </div><br>
									<div align="left" style="color:black"><div class="required"><label><b>Password :</b></div> </label><form:input class="contacttextform" path="password" placeholder="password" id="password" /></div><br>
									
									<input type="submit" class="contactformbutton" id="submitButton" value="Login" />
								</p>
							</form:form>

						</div>
						<!-- End Blog Text -->
					</div>


					
			</div>
			</div>
			</div>
			
		<!-- End Main Body Wrap -->

	</div>
	<!-- Start Footer -->
	<%@include file="includes/footer.jsp"%>	<!-- End Footer -->
	<!-- Start Scroll To Top Div -->
	<div id="scrolltab"></div>
	<!-- End Scroll To Top Div -->
</body>
<script>
// function validateForm()
// {
// var y=document.forms["myForm"]["email"].value;
// var atpos=y.indexOf("@");
// var dotpos=y.lastIndexOf(".");
// if (atpos<1 || dotpos<atpos+2 || dotpos+2 > y.length)
//   {
//   alert("Not a valid e-mail address");
//   return false;
//   }
// } 
 	
		
$(document).ready(function() {
	
	$("#submitButton").click(function() {
		var email=document.getElementById("email");
		console.log(email);
		if($('#fname').val()=='')
		{
			alert("Please Enter the Valid First Name");

		}
		else if($('#lname').val()=='')
		{
			alert("Please Enter the Valid Last Name");

		}
		else if($('#email').val()=='')
		{
			alert("Please Enter the Valid Email ID");
		}
		else
		{
			
	 		 var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	 		 if(re.test($('#email').val()))
	 		 {
	 			var domain = $('#email').val().split("@");
	 			console.log(email);
	 			 console.log(domain);
	 			 if(domain[1]=="yahoo.com")
	 				 {

	 				 }
	 			 else{
	 				$("#RegistrationForm").attr("action", "${pageContext.request.contextPath}/insert");
					$("#RegistrationForm").submit();

	 			 }	 			 
	 			 
	 			
	 		 } else {
				
	 			 alert("Please enter Email id");

			        }
	 		//$('#email').submit(form);
		    }
		
	});
});
</script>
</html>