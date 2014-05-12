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
<title>Top Courses per University</title>
<style type="text/css">
<% if(request.getAttribute("courseList")!=null){
                    		List<List<JsonObject>> details=(List<List<JsonObject>>)request.getAttribute("courseList");
                    		for(int i=1;i<=details.size();i++){%>
                    		<%    String divname= "#chart"+i; %>
                    		
									<%= divname %> {
										width		: 110%;
										height		: 500px;
										font-size	: 11px;
												}
										<% } } %>

	

</style>
<meta name="description" content="Response Premium Html Responsive Template - Portfolio Section" />
<meta name="keywords" content="Responsive Html, Responsive Template, Response, Filtered Portfolio" />
<meta name="apple-mobile-web-app-capable" content="yes" /> 
<meta name="apple-mobile-web-app-status-bar-style" content="grey" /> 
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;" /> 
<link rel="shortcut icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link rel="bookmark icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="js/twitter.js"></script>    
<script src="js/custom.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
<script src="js/jquery.prettyPhoto.js" type="text/javascript"></script>
<script type="text/javascript" src="js/amcharts.js"></script>
<script type="text/javascript" src="js/serial.js"></script>
<script type="text/javascript">
<% if (request.getAttribute("courseList") != null) { 
 List<List<JsonObject>>details = (List<List<JsonObject>>)request.getAttribute("courseList"); 
 List<JsonObject> dept=null;
 JsonObject chartdata=null;
 System.out.println(details);
 System.out.println("size is:"+details.size());
 Iterator<List<JsonObject>> itr=details.iterator();
 int i=1;
 String divname=null;
 while(itr.hasNext()){
	 dept=(List<JsonObject>)itr.next();
	// dept.add("univ",dept.get)
	divname="chart"+i;
	Iterator itr1=dept.iterator();
	while(itr1.hasNext()){
		chartdata=(JsonObject)itr1.next();
		
		chartdata.add("dept", chartdata.get("key").getAsJsonArray().get(1));
		chartdata.add("rating", chartdata.get("key").getAsJsonArray().get(2));
		chartdata.add("coursename", chartdata.get("value")); %>
		
		
		<% } %>
	
	<% System.out.println("++++++++++++++++++++++++++++++++++++++"); %>
	<% System.out.println(dept); %>
	
		
		
	AmCharts.ready(function() {
		var data= <%=dept %>
		
		var dept=<%= dept.get(0).get("dept").toString().toUpperCase() %>
		
	    chart = new AmCharts.AmSerialChart();
	    chart.dataProvider = data;
	    chart.categoryField = "id";
	    chart.startDuration = 1;
	   chart.columnWidth=0.2;
	    chart.columnSpacing= 5;
	    chart.angle=30;
	    chart.depth3D=15;
	    chart.color="#BA605B";
	    chart.handDrawn=true;
	    chart.addTitle(dept,15, "#2A11BC", 2, true);
	   
	  //  chart.addListener("clickGraphItem", handleClick);
	    var categoryAxis = chart.categoryAxis;
	    categoryAxis.labelRotation = 60;
	    categoryAxis.gridPosition = "start";

	    var graph = new AmCharts.AmGraph();
	    graph.valueField = "rating";
	    graph.balloonText = "[[coursename]]: [[value]]";
	    graph.type = "column";
	    graph.lineAlpha = 0;
	    graph.fillAlphas = 0.8;
	    graph.fillColors="#5BB5BA";
	    chart.addGraph(graph);
           
	    chart.write("<%= divname%>");
	});
	
<% System.out.println("div is:"+divname); %>	
<% i++; %>
	
<% }%>
 

<% } %>

</script>

</head>

<body>
<div id="header">
<%@include file="includes/menu.jsp" %>
<div id="header_small">
       
	
</div>
<div class="clear"></div>
        <!-- Start Social & Logo area -->
<%@include file="includes/social.jsp" %>     
</div>

<div id="main">
    <!-- Start H1 Title -->
    <div class="titlesnormal">
    	<% String uniname=request.getAttribute("univ").toString().toUpperCase();%>
    	
    	<h1><%= uniname %></h1>
        
        <span></span>
    
    </div>
    <!-- End H1 Title -->
    <!-- Start Main Body Wrap -->
    <div id="main-wrap">
        
        
        
        <!-- Start Box -->
        <div class="boxes-full">
        
        	<div class="boxes-padding fullpadding">
            	
                <!-- Start None Split Section -->
            	<div class="splitnone">
                
                	<div id="portfolio-container">
                    <% List<List<JsonObject>> details=(List<List<JsonObject>>)request.getAttribute("courseList"); %>
                    	<% String divnm=null; %>
                    	<% for (int i=1;i<=details.size();i++){ 
                    	   divnm="chart"+i; %>
                    	
                        <div class="element2 web" width="50%">
                        <div id= "<%=divnm %>">
                        	<div class="portfoliowrap">
                                
                            </div>
                        
                        </div>
                        </div>
                        <% } %>
                    	
                    	
                       
                        <!-- End 4 column portfolio -->
                    
                    </div>
                
                </div>
            	<!-- End None Split Section -->

            </div>

            <span class="box-arrow"></span>
        
        </div>
        <!-- End Box -->
    
    </div>
    <!-- End Main Body Wrap -->

</div>
<%@include file="includes/footer.jsp"%>
<!-- Start Scroll To Top Div -->
<div id="scrolltab"></div>
<!-- End Scroll To Top Div -->
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
</body>
</html>