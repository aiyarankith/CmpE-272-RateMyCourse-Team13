<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Repsonse 4 Column Filtered Portfolio Section</title>
<meta name="description" content="Response Premium Html Responsive Template - Portfolio Section" />
<meta name="keywords" content="Responsive Html, Responsive Template, Response, Filtered Portfolio" />
<meta name="apple-mobile-web-app-capable" content="yes" /> 
<meta name="apple-mobile-web-app-status-bar-style" content="grey" /> 
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;" /> 
<link rel="shortcut icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link rel="bookmark icon" href="http://www.derby-web-design-agency.co.uk/themes/response/images/favicon.png" /> 
<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="js/jquery.prettyPhoto.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
<script src="js/twitter.js"></script> 
<script src="js/jquery.isotope.min.js"></script>      
<script src="js/custom.js"></script>   
<script>
$(document).ready(function(){

    var $container = $('#portfolio-container')
    // initialize Isotope
        $container.isotope({
            // options...
            resizable: false, // disable normal resizing
            layoutMode : 'fitRows',
			itemSelector : '.element',
            animationEngine : 'best-available',

            // set columnWidth to a percentage of container width
            masonry: { columnWidth: $container.width() / 5 }
        });

        // update columnWidth on window resize
        $(window).smartresize(function(){
            $container.isotope({
            // update columnWidth to a percentage of container width
            masonry: { columnWidth: $container.width() / 5 }
            });
        });
        $container.imagesLoaded( function(){

                $container.isotope({
            // options...
                });
        });

        $('#portfolio-filter a').click(function(){
            var selector = $(this).attr('data-filter');
            $container.isotope({ filter: selector });
            return false;
        });
});
</script>
<script type="text/javascript" charset="utf-8">
  $(document).ready(function(){
    $("a[rel^='prettyPhoto']").prettyPhoto();
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
    
    	<h1>Repsonse 4 Column Filtered Portfolio Section</h1>
        
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
                
                    <div id="portfolio-filter-choice"><a href="portfolio-2-column.html" title="2 Column Portfolio"><img src="images/2column.png" alt="2 Column Portfolio" width="25" height="25"></a> <a href="portfolio-3-column.html" title="3 Column Portfolio"><img src="images/3column.png" alt="3 Column Portfolio" width="25" height="25"></a> <a href="portfolio.html" title="4 Column Portfolio"><img src="images/4column.png" alt="4 Column Portfolio" width="25" height="25"></a></div>
                
                	<!-- Start Portfolio Filter -->
               	  <div id="portfolio-filter">
                    
                    	<ul>
                        	
                            <li><strong>Filter: </strong></li>
                            <li><a href="#portfolio-filter" title="All" class="orangebutton smallrectange" data-filter="*">show all</a></li>
                        	<li><a href="#portfolio-filter" title="Web Design" class="orangebutton smallrectange" data-filter=".web">Web Design</a></li>
                            <li><a href="#portfolio-filter" title="Graphic Design" class="orangebutton smallrectange" data-filter=".graphic">Graphic Design</a></li>
                            <li><a href="#portfolio-filter" title="Print Design" class="orangebutton smallrectange" data-filter=".print">Print Design</a></li>
                            <li><a href="#portfolio-filter" title="Logo Design" class="orangebutton smallrectange" data-filter=".logo">Logo Design</a></li>
                        
                        </ul>
                    
                    </div>
                    <!-- End Portfolio Filter -->
                
                </div>
            	<!-- End None Split Section -->

            </div>

            <span class="box-arrow"> </span>
        
        </div>
        <!-- End Box -->
        
        <!-- Start Box -->
        <div class="boxes-full">
        
        	<div class="boxes-padding fullpadding">
            	
                <!-- Start None Split Section -->
            	<div class="splitnone">
                
                	<div id="portfolio-container">
                    
                    	<!-- Start 4 column portfolio -->
                        <div class="element web">
                        
                        	<div class="portfoliowrap">
                                                
                                <div class="title">Tuts Premium<span class="titlearrow"></span></div>
                                <div class="portfolioimage"><a href="images/latest-projects/larger-images/largeimage.jpg" rel="prettyPhoto" title="Lorem ipsum dolor sit amet"><img src="images/latest-projects/project01.jpg" alt="Lorem ipsum dolor sit amet" /></a></div>
                                <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas non ipsum nunc<span class="textarrow"></span></div>
                            
                            </div>
                        
                        </div>

                        <div class="element graphic">
                        
                        	<div class="portfoliowrap">
                                                
                                <div class="title">Themeforest<span class="titlearrow"></span></div>
                                <div class="portfolioimage"><a href="images/latest-projects/larger-images/largeimage.jpg" rel="prettyPhoto" title="Lorem ipsum dolor sit amet"><img src="images/latest-projects/project02.jpg" alt="Lorem ipsum dolor sit amet" /></a></div>
                                <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas non ipsum nunc<span class="textarrow"></span></div>
                            
                            </div>
                        
                        </div>

                        <div class="element logo">
                        
                        	<div class="portfoliowrap">
                                                
                                <div class="title">Graphicriver<span class="titlearrow"></span></div>
                                <div class="portfolioimage"><a href="images/latest-projects/larger-images/largeimage.jpg" rel="prettyPhoto" title="Lorem ipsum dolor sit amet"><img src="images/latest-projects/project03.jpg" alt="Lorem ipsum dolor sit amet" /></a></div>
                                <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas non ipsum nunc<span class="textarrow"></span></div>
                            
                            </div>
                        
                        </div>

                        <div class="element print">
                        
                        	<div class="portfoliowrap">
                                                
                                <div class="title">Tuts Premium<span class="titlearrow"></span></div>
                                <div class="portfolioimage"><a href="images/latest-projects/larger-images/largeimage.jpg" rel="prettyPhoto" title="Lorem ipsum dolor sit amet"><img src="images/latest-projects/project01.jpg" alt="Lorem ipsum dolor sit amet" /></a></div>
                                <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas non ipsum nunc<span class="textarrow"></span></div>
                            
                            </div>
                        
                        </div>
                        
                        <div class="element web">
                        
                        	<div class="portfoliowrap">
                                                
                                <div class="title">Tuts Premium<span class="titlearrow"></span></div>
                                <div class="portfolioimage"><a href="images/latest-projects/larger-images/largeimage.jpg" rel="prettyPhoto" title="Lorem ipsum dolor sit amet"><img src="images/latest-projects/project02.jpg" alt="Lorem ipsum dolor sit amet" /></a></div>
                                <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas non ipsum nunc<span class="textarrow"></span></div>
                            
                            </div>
                        
                        </div>

                        <div class="element web">
                        
                        	<div class="portfoliowrap">
                                                
                                <div class="title">Themeforest<span class="titlearrow"></span></div>
                                <div class="portfolioimage"><a href="images/latest-projects/larger-images/largeimage.jpg" rel="prettyPhoto" title="Lorem ipsum dolor sit amet"><img src="images/latest-projects/project03.jpg" alt="Lorem ipsum dolor sit amet" /></a></div>
                                <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas non ipsum nunc<span class="textarrow"></span></div>
                            
                            </div>
                        
                        </div>

                        <div class="element graphic web">
                        
                        	<div class="portfoliowrap">
                                                
                                <div class="title">Graphicriver<span class="titlearrow"></span></div>
                                <div class="portfolioimage"><a href="images/latest-projects/larger-images/largeimage.jpg" rel="prettyPhoto" title="Lorem ipsum dolor sit amet"><img src="images/latest-projects/project01.jpg" alt="Lorem ipsum dolor sit amet" /></a></div>
                                <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas non ipsum nunc<span class="textarrow"></span></div>
                            
                            </div>
                        
                        </div>

                        <div class="element Web">
                        
                        	<div class="portfoliowrap">
                                                
                                <div class="title">Tuts Premium<span class="titlearrow"></span></div>
                                <div class="portfolioimage"><a href="images/latest-projects/larger-images/largeimage.jpg" rel="prettyPhoto" title="Lorem ipsum dolor sit amet"><img src="images/latest-projects/project02.jpg" alt="Lorem ipsum dolor sit amet" /></a></div>
                                <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas non ipsum nunc<span class="textarrow"></span></div>
                            
                            </div>
                        
                        </div>
                        
                        <div class="element web">
                        
                        	<div class="portfoliowrap">
                                                
                                <div class="title">Tuts Premium<span class="titlearrow"></span></div>
                                <div class="portfolioimage"><a href="images/latest-projects/larger-images/largeimage.jpg" rel="prettyPhoto" title="Lorem ipsum dolor sit amet"><img src="images/latest-projects/project03.jpg" alt="Lorem ipsum dolor sit amet" /></a></div>
                                <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas non ipsum nunc<span class="textarrow"></span></div>
                            
                            </div>
                        
                        </div>

                        <div class="element web">
                        
                        	<div class="portfoliowrap">
                                                
                                <div class="title">Themeforest<span class="titlearrow"></span></div>
                                <div class="portfolioimage"><a href="images/latest-projects/larger-images/largeimage.jpg" rel="prettyPhoto" title="Lorem ipsum dolor sit amet"><img src="images/latest-projects/project01.jpg" alt="Lorem ipsum dolor sit amet" /></a></div>
                                <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas non ipsum nunc<span class="textarrow"></span></div>
                            
                            </div>
                        
                        </div>

                        <div class="element graphic web">
                        
                        	<div class="portfoliowrap">
                                                
                                <div class="title">Graphicriver<span class="titlearrow"></span></div>
                                <div class="portfolioimage"><a href="images/latest-projects/larger-images/largeimage.jpg" rel="prettyPhoto" title="Lorem ipsum dolor sit amet"><img src="images/latest-projects/project02.jpg" alt="Lorem ipsum dolor sit amet" /></a></div>
                                <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas non ipsum nunc<span class="textarrow"></span></div>
                            
                            </div>
                        
                        </div>

                        <div class="element Web">
                        
                        	<div class="portfoliowrap">
                                                
                                <div class="title">Tuts Premium<span class="titlearrow"></span></div>
                                <div class="portfolioimage"><a href="images/latest-projects/larger-images/largeimage.jpg" rel="prettyPhoto" title="Lorem ipsum dolor sit amet"><img src="images/latest-projects/project03.jpg" alt="Lorem ipsum dolor sit amet" /></a></div>
                                <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas non ipsum nunc<span class="textarrow"></span></div>
                            
                            </div>
                        
                        </div>
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
<!-- Start Footer -->
<%@include file="includes/footer.jsp"%>
<!-- End Footer -->
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