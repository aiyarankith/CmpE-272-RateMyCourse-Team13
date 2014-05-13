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

<html>
<head>
<meta charset="utf-8">
<title>Course Search</title>
<meta name="description"
content="Response Premium Html Responsive Template - Column Section" />
<meta name="keywords"
content="Responsive Html, Responsive Template, Response, Free Icons, List Section" />
<link rel="shortcut icon"
href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" />
<link rel="bookmark icon"
href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" />
<link href="css/main.css" rel="stylesheet" type="text/css">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="grey" />
<meta name="viewport"
content="width=device-width; initial-scale=1.0; maximum-scale=1.0;" />
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
<script>
var json = JSON.parse(course_details);
var name = json["name"];
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
</select> <label class="accessibly-hidden">Search for:</label> <input
type="text" class="search-terms" name="searchValue"
id="searchValue"
onfocus="if(this.value == 'Search...') { this.value = ''; }"
onblur="if(this.value == '') { this.value = 'Search...'; }"
placeholder="Search..." /> <label for="search-which"
class="accessibly-hidden">Search these:</label>
</span> <input type="submit" name="search-submit" id="search-submit"
value="Search" />
</form>

</div>
<div class="clear"></div>
<!-- End navigation area -->
<div class="clear"></div>

</div>

<div id="main">
<!-- Start H1 Title -->
<div class="titlesnormal">

<h1>Search Results</h1>

<span></span>

</div>
<!-- End H1 Title -->
<!-- Start Main Body Wrap -->
<div id="main-wrap">

<!-- Start Latest Project titles -->
<div class="boxes-full">

<div class="boxes-padding fullpadding">

<div class="clear"></div>
<hr />
<%
List<JsonObject> courseList = (List<JsonObject>) request.getAttribute("courseList");
if (courseList != null && courseList.size() > 0) {
Iterator<JsonObject> itr = courseList.iterator();
while (itr.hasNext()) {
try {
JsonObject courseDetails = (JsonObject) itr.next().get("value");
%>
<!-- Start None Split Section -->
<div class="splitnone">

<h3>
<a
href="${pageContext.request.contextPath}/get_course?courseId=<%=courseDetails.get("c_id").getAsString()%>"><%=courseDetails.get("name").getAsString()%></a>
<form id="ratingsForm">
<div class="stars">
<%
if (courseDetails.get("overall_rating").getAsFloat() >= 4.5) {
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
} else if (courseDetails.get("overall_rating").getAsFloat() >= 3.5) {
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
} else if (courseDetails.get("overall_rating").getAsFloat() >= 2.5) {
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
} else if ( courseDetails.get("overall_rating").getAsFloat() >= 1.5) {
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
} else if (courseDetails.get("overall_rating").getAsFloat() >= 0.5) {
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
} else if (courseDetails.get("overall_rating").getAsFloat() < 0.5) {
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
</h3>
<p>
<strong>ID/Dept/University:&nbsp;&nbsp;&nbsp;</strong><%=courseDetails.get("c_id").getAsString()%>&nbsp;/&nbsp;<%=courseDetails.get("dept").getAsString()%>&nbsp;/&nbsp;<%=courseDetails.get("university").getAsString()%></p>
<p>
<strong>About:&nbsp;&nbsp;&nbsp;</strong><%=courseDetails.get("description").getAsString().subSequence(0, 125)+"..."%></p>
<%
} catch (Exception e) {
continue;
}
}
} else {
%>
<h3>No courses found</h3>
<hr />
<p>We suggest to,</p>
<p>Double check your input.</p>
<p>Try with other search category.</p>
<%
}
%>
<hr />
<!-- End None Split Section -->
<div class="clear"></div>
<hr />
</div>

<span class="box-arrow"></span>

</div>
<!-- End Latest Project titles -->

</div>
<!-- End Main Body Wrap -->

</div>
<!-- Start Footer -->
<%@include file="includes/footer.jsp"%>
<!-- End Footer -->
<!-- Start Scroll To Top Div -->
<div id="scrolltab"></div>
<!-- End Scroll To Top Div -->
</body>
</html>