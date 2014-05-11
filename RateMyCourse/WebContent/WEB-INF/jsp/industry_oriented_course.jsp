<!DOCTYPE HTML>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.lang.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="org.json.simple.*"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.google.gson.JsonObject"%>
<html>
<head>
<meta charset="utf-8">
<title>Top 10 Industry Oriented Courses</title>
<style type="text/css">
#chartDiv {
	width		: 90%;
	height		: 500px;
	font-size	: 11px;
	
}
</style>


<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
<script type="text/javascript" src="js/amcharts.js"></script>
<script type="text/javascript" src="js/serial.js"></script>
<script type="text/javascript" src="http://docs.amcharts.com/2/javascriptcharts/AmGraph#fillColors"></script>

<script src="js/twitter.js"></script>    
<script src="js/custom.js"></script>   

<script type="text/javascript">
<% List<JsonObject> details = null;
JsonObject name=null;
System.out.println("helloooo"); %>

<% if (request.getAttribute("courseList") != null) { %>
<% details = (List<JsonObject>)request.getAttribute("courseList"); 
 Iterator itr=details.iterator();

 while(itr.hasNext()){
	 name=(JsonObject)itr.next();
	 
	name.add("coursename", name.get("value"));
	//System.out.println(name);
}
System.out.println(details);
//System.out.println(name);
 
} %>



var chart;
// var data=[{"id": "EE 234", "key":5, "value": "intro"}, {"id": "CE235", "key": 4, "value":"gsdhfaj"}];
var data= <%=details %>

function handleClick(event)
{
	alert("under construction");
}


AmCharts.ready(function() {
    // SERIAL CHART
    chart = new AmCharts.AmSerialChart();
    chart.dataProvider = data;
    chart.categoryField = "id";
    chart.startDuration = 1;
    chart.columnWidth=0.2;
    chart.columnSpacing= 5;
    chart.angle=30;
    chart.depth3D=15;
    chart.color="#2789BA";
    chart.handDrawn=true;
    
    
    
    chart.addListener("clickGraphItem", handleClick);
    
    var categoryAxis = chart.categoryAxis;
    categoryAxis.labelRotation = 60;
    categoryAxis.gridPosition = "start";

    
    var graph = new AmCharts.AmGraph();
    graph.valueField = "key";
    graph.balloonText = "[[coursename]]: [[value]]";
    graph.type = "column";
    graph.lineAlpha = 0;
    graph.fillAlphas = 0.8;
    graph.fillColors="#BA5827"
    chart.addGraph(graph);

    chart.write("chartDiv");
});


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
    
    	<h1>Top 10 Industry Oriented Courses</h1>
        
        <span></span>
    
    </div>
    <!-- End H1 Title -->
    <!-- Start Main Body Wrap -->
    <div id="main-wrap">
        
        <!-- Start Left Section -->
        <div id="chartDiv"></div>	
        <!-- End Left Section -->
        
        
    
    </div>
    <!-- End Main Body Wrap -->

</div>
<%@include file="includes/footer.jsp"%>
<!-- Start Scroll To Top Div -->
<div id="scrolltab"></div>
<!-- End Scroll To Top Div -->
</body>
</html>