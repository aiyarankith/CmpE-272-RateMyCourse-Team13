<!DOCTYPE HTML>
<%@page import="com.google.gson.JsonElement"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="org.json.simple.*"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>


<html>
<head>
<meta charset="utf-8">
<title>Course Ratings Page</title>
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
<link href="css/main.css" rel="stylesheet" type="text/css">
<script
src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
<script src="js/twitter.js"></script>
<script src="js/custom.js"></script>
<script>
//// Start Simple Sliders ////
$(function() {
setInterval("rotateDiv()", 10000);
});

function rotateDiv() {
var currentDiv = $("#simpleslider div.current");
var nextDiv = currentDiv.next();
if (nextDiv.length == 0)
nextDiv = $("#simpleslider div:first");

currentDiv.removeClass('current').addClass('previous').fadeOut('2000');
nextDiv.fadeIn('3000').addClass('current', function() {
currentDiv.fadeOut('2000', function() {
currentDiv.removeClass('previous');
});
});

}
//// End Simple Sliders ////
</script>
<script type="text/javascript">
function showhidediv(rad){
var rads=document.getElementsByName(rad.name);
document.getElementById('one').style.display=(rads[0].checked)?'block':'none' ;
document.getElementById('two').style.display=(rads[1].checked)?'block':'none' ;
document.getElementById('three').style.display=(rads[2].checked)?'block':'none' ;
}
</script>
</head>

<body>
<div id="header">
<%@include file="includes/menu.jsp"%>
<div id="header_small">

<form action="${pageContext.request.contextPath}/search"
method="post" name="searchForm">
<span id="search-page-border"> <select class="search-terms"
name="searchCategory" id="searchCategory" style="width: auto"
data-selected="CNAME">
<option id="cname" value="CNAME">Course Name</option>
<option id="cid" value="CID">Course ID</option>
<option id="cdesc" value="CDESC">Course Content</option>
</select>
<label class="accessibly-hidden">Search for:</label>
<input
type="text" class="search-terms" name="searchValue" id="searchValue"
onfocus="if(this.value == 'Search...') { this.value = ''; }"
onblur="if(this.value == '') { this.value = 'Search...'; }"
placeholder="Search..." /> <label for="search-which"
class="accessibly-hidden">Search these:</label>
</span>
<input type="submit" name="search-submit" id="search-submit"
value="Search" />
</form>

</div>
<div class="clear"></div>

</div>

<div id="main">
<!-- Start H1 Title -->
<div class="titlesnormal">

<h1>Course Details</h1>

<span></span>

</div>
<!-- End H1 Title -->
<!-- Start Main Body Wrap -->
<div id="main-wrap">
<div class="boxes-full">
        
        <div class="boxes-padding fullpadding">
           
                <div class="split23">
                <% String course_id = null;
String course_name = null;
JsonObject details = null;
System.out.println("out");
if (request.getAttribute("course_details") != null) {
System.out.println("in");
%>
<% details = (JsonObject) request.getAttribute("course_details");
course_id = details.get("c_id").getAsString();
course_name = details.get("name").getAsString();
%>
                    <h2><%=details.get("name").getAsString()%></h2>
                    <hr />
                    
<p>
<b class="settingsicon">Course ID:</b>
<%=details.get("c_id").getAsString()%>

</p>
<p>
<b class="settingsicon">Department: </b><%=details.get("dept").getAsString()%>
</p>
<p>
<b class="settingsicon">University: </b><%=details.get("university").getAsString()%>
</p>
<p>
<b class="settingsicon">Professor: </b><%=details.get("professor").getAsString()%>
</p>
<p>
<b class="settingsicon">Description: </b>
<%=details.get("description").getAsString()%>
</p>
<table>
<tr>
<td>
<b class="tagicon">Overall Ratings: </b>
</td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td>
<td>
<form id="ratingsForm">
<div class="stars">
<%
if (details.get("overall_rating").getAsFloat() >= 4.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" checked /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("overall_rating").getAsFloat() >= 3.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" checked /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("overall_rating").getAsFloat() >= 2.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" checked /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("overall_rating").getAsFloat() >= 1.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" checked />
<label class="star-2" for="star-2">2</label> <input
type="radio" name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("overall_rating").getAsFloat() >= 0.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1"
checked /> <label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else {
%>
<input type="radio" name="star" class="star-1" id="star-1"
/> <label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
}
%>
</div>

</form>
</td>
</tr>
</table>	
<hr />
<table>
<tr> 
<td><b class="settingsicon">Industrialists Ratings: </b>
</td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td>
<form id="ratingsForm">
<div class="stars">
<%
if (details.get("ind_user_rating").getAsFloat() >= 4.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" checked /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("ind_user_rating").getAsFloat() >= 3.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" checked /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("ind_user_rating").getAsFloat() >= 2.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" checked /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("ind_user_rating").getAsFloat() >= 1.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" checked />
<label class="star-2" for="star-2">2</label> <input
type="radio" name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("ind_user_rating").getAsFloat() >= 0.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1"
checked /> <label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else {
%>
<input type="radio" name="star" class="star-1" id="star-1"
/> <label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
}
%>
</div>

</form>
</td>
</tr>
</table>
<hr />
<table>	
<tr>
<td>
<b class="settingsicon">Enrolled Students Ratings: </b>
</td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td>
<form id="ratingsForm">
<div class="stars">
<%
if (details.get("est_user_rating").getAsFloat() >= 4.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" checked /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("est_user_rating").getAsFloat() >= 3.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" checked /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("est_user_rating").getAsFloat() >= 2.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" checked /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("est_user_rating").getAsFloat() >= 1.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" checked />
<label class="star-2" for="star-2">2</label> <input
type="radio" name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("est_user_rating").getAsFloat() >= 0.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1"
checked /> <label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else {
%>
<input type="radio" name="star" class="star-1" id="star-1"
/> <label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
}
%>
</div>

</form>
</td>
</tr>
</table>
<hr />
<table>
<tr>
<td>
<b class="settingsicon">Unenrolled Students Ratings: </b>
</td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td></td>
<td>
<form id="ratingsForm">
<div class="stars">
<%
if (details.get("uest_user_rating").getAsFloat() >= 4.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" checked /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("uest_user_rating").getAsFloat() >= 3.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" checked /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("uest_user_rating").getAsFloat() >= 2.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" checked /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("uest_user_rating").getAsFloat() >= 1.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1" />
<label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" checked />
<label class="star-2" for="star-2">2</label> <input
type="radio" name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else if (details.get("uest_user_rating").getAsFloat() >= 0.5) {
%>
<input type="radio" name="star" class="star-1" id="star-1"
checked /> <label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
} else {
%>
<input type="radio" name="star" class="star-1" id="star-1"
/> <label class="star-1" for="star-1">1</label> <input
type="radio" name="star" class="star-2" id="star-2" /> <label
class="star-2" for="star-2">2</label> <input type="radio"
name="star" class="star-3" id="star-3" /> <label
class="star-3" for="star-3">3</label> <input type="radio"
name="star" class="star-4" id="star-4" /> <label
class="star-4" for="star-4">4</label> <input type="radio"
name="star" class="star-5" id="star-5" /> <label
class="star-5" for="star-5">5</label> <span></span>
<%
}
%>
</div>

</form>
</td>
</tr>
</table>
<hr />
<p>
<b class="settingsicon"> Demo Video Link: </b><a
href="<%=details.get("demo_video_link").getAsString()%>"><%=details.get("demo_video_link").getAsString()%>
</a>
</p>
<p>
<b class="settingsicon">Related Document Link: </b><a
href="<%=details.get("related_doc_link").getAsString()%>"><%=details.get("related_doc_link").getAsString()%>
</a>
</p>
<%
} else {
%>
<p>Search by Course Id or Course Name to get all the details,
Ratings, Latest Comments and Description</p>

<br> <br> <br>
<%
}
%>
                </div>
                <!-- Start one 3rd and two 3rd Split Section -->
                <div class="split3">
                    <h3>Prerequisites Stuff</h3>
                    <hr/>
                     <h5>Prerequisites for this course...</h5>
                     <% if(details != null && (details.get("prereq").getAsString().length() > 0)) { 
                     %>
                     <ul><li>
                     <a href="${pageContext.request.contextPath}/get_course?courseId=<%=details.get("prereq").getAsString()%>" ><%=details.get("prereq").getAsString()%></a>
                     </li></ul>
                     <% } else {%>
                      <p> Clear Admit</p>
                     <% } %>
                     <hr/>
                     <h5>And this course is prerequisite for...</h5>
                     <% List<JsonObject> list = (List<JsonObject>) request.getAttribute("course_prereq4");
if (list != null && list.size() > 0) { %>
                    <ul>
              <%  Iterator<JsonObject> courseItr = list.iterator();
while (courseItr.hasNext()) {
JsonArray course = courseItr.next().get("value").getAsJsonArray();
String id = course.get(0).getAsString();
%>
                    <li>
                    <a href="${pageContext.request.contextPath}/get_course?courseId=<%=id%>" ><%=id%></a>
                    </li>
                <% } %>
                    </ul>
                     <% } else { %>
                     <p> Nothing </p>
                     <% } %>
                    <hr/>
                </div>
                <!-- End one 3rd and two 3rd Split Section -->
                <div class="clear"></div>
                <hr />

</div>
</div>



<!-- Start Left Section -->
<div class="leftsection">

<!-- Start Blog Post -->
<div class="blogwrapstart">
</div>
<!-- End Blog Post -->

<!-- Start Blog Post -->
<div class="blogwrap">

<div class="blogcommenttitle">
<h3>Comments</h3>
</div>
<span class="box-arrow"></span>

</div>
<!-- End Blog Post -->
<!-- Start Blog Comments -->
<div class="blogcomment">


<%
if (request.getAttribute("course_comments") != null) {
%>
<%
List<JsonObject> comments = (List<JsonObject>) request.getAttribute("course_comments");
%>
<%
System.out.println("size : " + comments.size());
%>
<%
for (int i = 0; i < comments.size(); i++) {
JsonObject temp = comments.get(i);
JsonObject comment = (JsonObject) temp.get("value");
%>
<div class="blogwcommentwrap">
<div class="commenttitle">
<p>
<span class="avatarname"><%=comment.get("user_name")%></span> <span
class="avatardate">On: <span class="avatardateorange"><%=comment.get("date")%></span></span>
<span class="avatarreply"><a href="#" title="reply">Ratings
<%=comment.get("user_rating")%></a></span>
</p>

</div>
<div class="commentuser">
<img src="images/avatar.jpg" alt="John Doe">
</div>

<div class="commenttext">


<p><%=comment.get("comment")%></p>

</div>

<span class="box-arrow"></span>

</div>
<% } %>
<% } else { %>
<p> There are no comments to display</p>
<%	}%>

</div>
<!-- End Blog Comments -->
</div>
<!-- End Left Section -->

<!-- Start Right Section -->
        <div class="rightsection">
        
        <!-- Start Blog Widget -->
            <div class="blogwidgetstart">
            
            </div>
            <!-- End Blog Widget -->
            
        <!-- Start Blog Widget -->
            <div class="blogwidget">
            <!-- Start Categories Widget -->
            <div class="widgettitle"><h4>Facts</h4></div>
                
                <div class="widgetbody">
                
                <div class="blogcategories">
                    
                    <ul>
                        <li>Get the latest RSS Feeds from craiglist</li>
                            <li>Search for top followed courses</li>
                            <li>Search for you favourite course</li>
                            <li>Get to know whats hot</li>
                            <li>Find top rated course by industrial expert</li>
                            <li>Read comments from others</li>
                            <li>Add comments and ratings</li>
                            <li>Send your complains</li>
                            <li>Post feedbacks</li>
                            <li>Demand for the course you wish on the list</li>
                            <li>Content wise searching</li>
                            <li>Get to know About Us</li>
                        </ul>
                    
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

<h2>Comment</h2>

</div>

<div class="boxes-padding fullpadding">

<div id="contactwarning"></div>
<div id="contactajax"></div>

<form:form action="${pageContext.request.contextPath}/insert_comment" method="post" modelAttribute="comment_detail">
<div class="contacttextarea">
<form:input type="hidden" path="course_id" id="course_id" name="course_id" value="<%=course_id %>" class="contacttextform" />
<form:input type="hidden" path="course_name" id="course_id" name="course_name" value="<%=course_name %>" class="contacttextform" />
                    <div align="left" style="color: black">	<b>Full Name* :</b></div>
<form:input path="commenter_name" id="name" name="name"	type="text" class="contacttextform" />

<div align="left" style="color: black"><b>Email* :</b></div>
<form:input path="commenter_email" id="name" name="email" type="text" class="contacttextform" />
<br>
<div align="left" style="color: black"><b>You Are? :</b></div>
<form:radiobuttons path="type_of_user" items="${user_type}" onclick="showhidediv(this);" style="xcolor :black;"/>
<%-- <form:select path="rating" name="rating" style="width: 355px;">
<c:forEach items="${user_type}" var="item">
<option value="${item}" style="font-family:arial">${item}</option>
</c:forEach>
</form:select> --%>

<div id="one" class="CF" >
<div class="accordionwrap">
                        
                           <div class="accordiontitle"><a href="#">Enrolled Students</a></div>
                           <div class="accordioncontent">
<div align="left" style="color: black">	<b>How do you rate the content of the Course relevent to Industry?</b></div>
<form:radiobuttons path="content_rating" items="${stars}" />
<div align="left" style="color: black">	<b>How far does the Course help you in future endevours?</b></div>
<form:radiobuttons path="technology_rating" items="${stars}" />
<div align="left" style="color: black">	<b>Your Overall Experience! Would you recommend this course to other?</b></div>
<form:radiobuttons path="overall_rating" items="${stars}" />
</div>
</div>
</div>
<div id="two" style="display:none;" class="CF" >
<div class="accordionwrap">
                        
                           <div class="accordiontitle"><a href="#">Unenrolled Student</a></div>
                           <div class="accordioncontent">
<div align="left" style="color: black">	<b>How do you find the content of the course interesting?</b></div>
<form:radiobuttons path="content_rating" items="${stars}" />
<div align="left" style="color: black">	<b>Does the technology help gain jobs?</b></div>
<form:radiobuttons path="technology_rating" items="${stars}" />
<div align="left" style="color: black">	<b>Overall Ratings!</b></div>
<form:radiobuttons path="overall_rating" items="${stars}" />
</div>
</div>
</div>
<div id="three" style="display:none;" class="CF" >
<div class="accordionwrap">
                        
                           <div class="accordiontitle"><a href="#">Industrialist</a></div>
                           <div class="accordioncontent">
<div align="left" style="color: black">	<b>Does the course structure match your company requirements?</b></div>
<form:radiobuttons path="content_rating" items="${stars}" />
<div align="left" style="color: black">	<b>How do you rate the overall future of this technology?</b></div>
<form:radiobuttons path="technology_rating" items="${stars}" />
<div align="left" style="color: black">	<b>Overall Ratings!</b></div>
<form:radiobuttons path="overall_rating" items="${stars}" />
</div>
</div>
</div>
<br><br><br>
        <div align="left"> <b>Comments* :</b></div> <form:textarea path="comment" name="comment" id="comment" cols="3" rows="5" class="contacttextform" />
<br> <font color="red">Asterisk (*) marked fields are mandatory.</font>
<fieldset>
<br>
</fieldset>
<fieldset>
<input name="Submit" type="submit" class="contactformbutton" value="Submit">
</fieldset>
</div>
<div class="contacttextboxes">
<h3>Information</h3>
                        
                        <!-- Start Accordian -->
                        <div class="accordionwrap">
                        
                            <div class="accordiontitle"><a href="#">San Jose State University</a></div>
                            <div class="accordioncontent">
                                <p>San Jose State University (often abbreviated San Jose State or SJSU) is a comprehensive public university located in San Jose, California, United States. It is the founding school of the 23 campus California State University (CSU) system, and holds the distinction of being the oldest public institution of higher education on the West Coast of the United States.</p>
                            </div>
                        
                            <div class="accordiontitle"><a href="#">California State University, Long Beach</a></div>
                            <div class="accordioncontent">
                                <p>California State University, Long Beach (also known as Cal State Long Beach, Long Beach State, CSULB, LBSU, or The Beach) is the second largest campus of the 23 school California State University system (CSU) and one of the largest universities in the state of California by enrollment, its student body numbering 36,279 for the Fall 2012 semester. At 5,148 students, the university enrolls one of the largest graduate student populations across the CSU and in the state of California alone. The university is located in the Los Altos neighborhood of Long Beach at the southeastern coastal tip of Los Angeles County, less than one mile from the border with Orange County</p>
                            </div>
                        
                            <div class="accordiontitle"><a href="#">California State University, East Bay</a></div>
                            <div class="accordioncontent">
                                <p>California State University, East Bay (commonly referred to as Cal State East Bay, CSU East Bay and CSUEB) is a public university located in the eastern region of the San Francisco Bay Area. The university, as part of the 23-campus California State University system, offers 136 undergraduate and 60 post-baccalaureate areas of study.</p>
                            </div>
                            <div class="accordiontitle"><a href="#">California State University, Fresno</a></div>
                            <div class="accordioncontent">
                                <p>California State University, Fresno is a public comprehensive university and part of the 23 campus California State University system</p>
                            </div>
                            <div class="accordiontitle"><a href="#">California State University, Sacramento</a></div>
                            <div class="accordioncontent">
                                <p>California State University, Sacramento (Sacramento State, informally Sac State), founded in 1947 as Sacramento State College, is a public comprehensive university in the city of Sacramento, the capital city of the U.S. state of California, and is the eleventh oldest school in the 23 campus California State University system. </p>
                            </div>
                        
                        </div>
                        <!-- End Accordian -->
                
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