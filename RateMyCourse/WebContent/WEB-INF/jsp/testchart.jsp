<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Insert title here</title>
<style type="text/css">
#chartDiv {
	width		: 50%;
	height		: 500px;
	font-size	: 11px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/amcharts.js"></script>
<script type="text/javascript" src="js/serial.js"></script>
<script type="text/javascript">
<% List<JsonObject> details = null; 
System.out.println("helloooo");%>

<% if (request.getAttribute("courseList") != null) { %>
<% details = (List<JsonObject>)request.getAttribute("courseList"); 
System.out.println(details.get(0).get("value"));



} %>
// var data=[{"id": "ENGR 282", "key": 10.5, "value": ["ENGR 283", "topics in engg"]}, {"id": "ENGR 282", "key": 8.5, "value": ["ENGR 283", "engg mechanics"]}];


data = <%=details %>
var chart = AmCharts.makeChart("chartDiv", {
    "type": "serial",
    "theme": "none",
    "columnWidth:": 0.6,
    "columnSpacing": 5,
    "angle" : 30,
    "depth3D": 15,
    "dataProvider": data,
    "valueAxes": [{
        "axisAlpha": 0,
        "position": "top"
    }],
    "startDuration": 1,
    "graphs": [{
        "balloonText": "Income:[[value]]",
        "fillAlphas": 0.8,
        "lineAlpha": 0.2,
        "title": "Rate",
        "type": "column",
        "valueField": "id"
    }, {
        "balloonText": "Ratings:[[value]]",
        "fillAlphas": 0.8,
        "lineAlpha": 0.2,
        "title": "Courses",
        "type": "column",
        "valueField": "key"
    }],
    "rotate": true,
    "categoryField": "id",
    "categoryAxis": {
        "gridPosition": "start",
        "position": "left"
    },
	"exportConfig":{
		"menuBottom":"20px",
        "menuRight":"20px",
        
    }
});
</script>

</head>
<body>
<div id="chartDiv"></div>	

<% if (request.getAttribute("courseList") != null) { %>
<% details = (List<JsonObject>)request.getAttribute("courseList"); 
//System.out.println(details);
} %>	
</body>
</html>