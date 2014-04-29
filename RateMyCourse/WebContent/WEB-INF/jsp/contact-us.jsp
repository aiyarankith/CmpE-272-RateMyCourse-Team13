<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>contact response</title>
<meta name="description" content="Response Premium Html Responsive Template - Contact Page" />
<meta name="keywords" content="Responsive Html, Responsive Template, Response, Free Icons, List Section" />
<meta name="apple-mobile-web-app-capable" content="yes" /> 
<meta name="apple-mobile-web-app-status-bar-style" content="grey" /> 
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;" /> 
<link rel="shortcut icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link rel="bookmark icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script src="js/twitter.js"></script>    
<script src="js/custom.js"></script>
<script src="js/google.map.js"></script>   
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
			var usersphonenumber = $("#phone");
			var usersmessage = $("#comment");
			var contactformid = $("#contactformid");
			var url = "contact.php";
			
				var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
				var valid = emailReg.test(usersemail.val());
			 
				if(!valid) {
					$("#contactwarning").html('<p class="rejectionalert"><span>Your email is not valid!</span></p>').slideDown().delay(2000).slideUp();
					$('input[type=submit]', $("#ajaxcontactform")).removeAttr('disabled');
					return false;
				}
			
			  if (usersname.val() == "" || usersname.val() == "Please Insert Your Name") {				  
				   $("#contactwarning").html('<p class="rejectionalert"><span>Please Insert Your Name!</span></p>').slideDown().delay(2000).slideUp();
				   $('input[type=submit]', $("#ajaxcontactform")).removeAttr('disabled');
				   return false;			   
			  }
			  if (usersemail.val() == "" || usersemail.val() == "Please Insert Your Email") {
				   $("#contactwarning").html('<p class="rejectionalert"><span>Please Insert Your Email!</span></p>').slideDown().delay(2000).slideUp();
				   $('input[type=submit]', $("#ajaxcontactform")).removeAttr('disabled');
				   return false;
			  }
			  if (usersphonenumber.val() == "" || usersphonenumber.val() == "Please Insert Your Phone Number") {
				   $("#contactwarning").html('<p class="rejectionalert"><span>Please Insert Your Phone Number!</span></p>').slideDown().delay(2000).slideUp();
				   $('input[type=submit]', $("#ajaxcontactform")).removeAttr('disabled');
				   return false;
			  }
			  if (usersmessage.val() == "" || usersmessage.val() == "Please Leave A Message") {
				   $("#contactwarning").html('<p class="rejectionalert"><span>You forgot to leave a message!</span></p>').slideDown().delay(2000).slideUp();
				   $('input[type=submit]', $("#ajaxcontactform")).removeAttr('disabled');
				   return false;
			  }

					$.post(url,{ usersname: usersname.val(), usersemail: usersemail.val(), usersphonenumber: usersphonenumber.val(), usersmessage: usersmessage.val(), contactformid: contactformid.val() } , function(data) {
						$('#contactajax').html(data);
						$('#contactajax').slideDown().delay(3000).slideUp();
						$("#name").val('Please Insert Your Name');
						$("#email").val('Please Insert Your Email');
						$("#phone").val('Please Insert Your Phone Number');
						$("#comment").val('Please Leave A Message');
						$('input[type=submit]', $("#ajaxcontactform")).removeAttr('disabled');
					});
			  
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
    
    	<h1>contact response</h1>
        
        <span></span>
    
    </div>
    <!-- End H1 Title -->
    <!-- Start Main Body Wrap -->
    <div id="main-wrap">
        
        <!-- Start Left Section -->
        <div class="leftsection">

            <!-- Start Google Maps -->
        	<div class="blogwrapstart">
            
            	<div id="map_canvas"></div>
                <span class="box-arrow"></span>
            
            </div>
            <!-- End Google Maps -->
        
        </div>
        <!-- End Left Section -->
        
        <!-- Start Right Section -->
        <div class="rightsection">
            
        	<!-- Start Blog Widget -->
            <div class="blogwidgetstart">
            	<!-- Start Categories Widget -->
            	<div class="widgettitle"><h4>Contact Details</h4></div>
                
                <div class="widgetbody">
                
                	<div class="blogcategories">
                    
                    	<div class="contactdetails">
                    
                            <p>info@domainname.com</p>
                            <p>+44 1234 567 890</p>
                            <p>12 Address Road<br />Madeup Town<br />Madeup City<br />Zip12 0de</p>
                            
                        </div>
                    
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
            
                <h2>Contact Responsive</h2>
            
            </div>
        
        	<div class="boxes-padding fullpadding">
            
            <div id="contactwarning"></div>
            <div id="contactajax"></div>
            
            <form action="javascript:parseResponse();" method="post" name="ajaxcontactform" id="ajaxcontactform">
            
            	<div class="contacttextarea">
                	<input name="contactformid" id="contactformid" type="hidden" value="1" />
                
                	<fieldset>
                    	<textarea name="comment" id="comment" cols="5" rows="5" class="contacttextarea"onfocus="if (this.value == 'Please Leave A Message') {this.value = '';}">Please Leave A Message</textarea>
                    </fieldset>
                
                </div>
                
                <div class="contacttextboxes">
                
                	<fieldset>
                    	<input id="name" name="name" type="text" class="contacttextform" onfocus="if (this.value == 'Please Insert Your Name') {this.value = '';}"value="Please Insert Your Name">
                    </fieldset>
                    
                	<fieldset>
                    	<input id="phone" name="phone" type="text" class="contacttextform" onfocus="if (this.value == 'Please Insert Your Phone Number') {this.value = '';}"value="Please Insert Your Phone Number">
                    </fieldset>
                    
                	<fieldset>
                    	<input id="email" name="email" type="text" class="contacttextform" onfocus="if (this.value == 'Please Insert Your Email') {this.value = '';}"value="Please Insert Your Email">
                    </fieldset>
                    
                	<fieldset>
                    	<input name="send" type="submit" class="contactformbutton" value="Send">
                    </fieldset>
                
                </div>
                
            </form>
            
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