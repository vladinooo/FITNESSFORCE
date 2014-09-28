<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/bootstrap/mosaic/img/favicon.png?v=2">
		
		<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>
	
		<!-- jquery -->
	    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
	    
	    <!-- Bootstrap core CSS -->
	    <link href="${pageContext.request.contextPath}/static/bootstrap/mosaic/css/bootstrap.css" rel="stylesheet">
	    
	    <!-- Plugins stylesheets -->
    	<link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/select2/select2.css" rel="stylesheet" />
    	<link href="${pageContext.request.contextPath}/static/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
    	<link href="${pageContext.request.contextPath}/static/plugins/twitter-bootstrap-wizard/prettify.css" rel="stylesheet" />
    		
	    <!-- Custom styles for this template -->
	    <link href="${pageContext.request.contextPath}/static/bootstrap/mosaic/css/color-styles.css" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/static/bootstrap/mosaic/css/ui-elements.css" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/static/bootstrap/mosaic/css/custom.css" rel="stylesheet">
	    
	    <!-- Custom CSS -->
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
	    
	    <!-- Resources -->
	    <link href="${pageContext.request.contextPath}/static/bootstrap/mosaic/css/animate.css" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/static/bootstrap/mosaic/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	    <link href='http://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
	    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500,400italic,500italic,700italic' rel='stylesheet' type='text/css'>
	
	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	    <![endif]-->	   
	    
	</head>

	<body class="body-ff">

	    <!-- Extra Bar -->
	    <div class="mini-navbar mini-navbar-ff hidden-xs">
	      <div class="container">
	        <div class="col-sm-12">
	          
	          <sec:authorize access="!isAuthenticated()">
	         	<a href="<c:url value='/create_user'/>" class="pull-right"><i class="fa fa-arrow-circle-down"></i> Create Account</a>
	         	<a href="<c:url value='/login'/>" class="pull-right"><i class="fa fa-sign-in"></i> Log In</a>
			  </sec:authorize>
			
			  <sec:authorize access="isAuthenticated()">
	         	<a href="<c:url value='/j_spring_security_logout'/>" class="pull-right"><i class="fa fa-sign-out"></i> Log Out</a>
	         	<a href="<c:url value='/dashboard'/>" class="pull-right"><i class="fa fa-credit-card"></i> Checkout</a>
	         	<a href="<c:url value='/cart'/>" class="pull-right"><i class="fa fa-shopping-cart"></i> Cart (<c:out value="${fn:length(cartItems)}"/>)</a>
	         	<a href="<c:url value='/view_profile'/>" class="pull-right"><i class="fa fa-user"></i> My Account</a>
			  </sec:authorize>
	          
	          
	          <a href="#" class="pull-right" id="nav-search"><i class="fa fa-search"></i> Search</a>
	          <a href="#" class="pull-right hidden" id="nav-search-close"><i class="fa fa-times"></i></a>
	          
	          <!-- Search Form -->
	          <form class="pull-right hidden" role="search" id="nav-search-form">
	            <div class="input-group">
	              <input type="text" class="form-control" placeholder="Search">
	              <span class="input-group-btn">
	                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
	              </span>
	            </div>
	          </form>
	        </div>
	      </div>
	    </div>
	
	    <div class="navbar navbar-ff navbar-static-top" role="navigation">
	      <div class="container">
	
	        <!-- Navbar Header -->
	        <div class="navbar-header">
	          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <a href="<c:url value='/'/>" class="navbar-brand"><span class="ff-logo"></span></a>
	        </div> <!-- / Navbar Header -->
	
	        <!-- Navbar Links -->
	        <div class="navbar-collapse collapse">
	          <ul class="nav navbar-nav navbar-right">
	            <li><a href="<c:url value='/'/>" class="bg-hover-color">Home</a></li>
	            <li><a href="<c:url value='/rules'/>" class="bg-hover-color">Rules</a></li>
	            <li><a href="<c:url value='/timetable'/>" class="bg-hover-color">Timetable</a></li>
	            <li><a href="<c:url value='/news'/>" class="bg-hover-color">News</a></li>
	            <li><a href="<c:url value='/shop'/>" class="bg-hover-color">Shop</a></li>
	          </ul>
	
	          <!-- Search Form (xs) -->
	          <form class="navbar-form navbar-left visible-xs" role="search">
	            <div class="form-group">
	              <input type="text" class="form-control" placeholder="Search">
	            </div>
	            <button type="submit" class="btn btn-default">Go!</button>
	          </form> <!-- / Search Form (xs) -->
	
	        </div> <!-- / Navbar Links -->
	      </div> <!-- / container -->
	    </div> <!-- / navbar -->
	
	    <!-- Wrapper -->
	    <div class="wrapper">
	    
		    <!-- Topic Header -->
			<div class="topic" style="display: none">
			  <div class="container">
			    <div class="row">
			      <div class="col-sm-4">
			        <h3 class="primary-font"><tiles:insertAttribute name="topic"></tiles:insertAttribute></h3>
			      </div>
			    </div>
			  </div>
			</div>
	
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
	          
	    </div> <!-- / .wrapper -->
	
	    <!-- Footer -->
	    <footer class="footer-ff">
	      <div class="container">
	        <div class="row">
	          <!-- Contact Us -->
	          <div class="col-sm-4">
	            <h3 class="text-color"><span class="border-color">Contact Us</span></h3>
	            <div class="content">
	              <p>
	              San Francisco, CA 94101<br />
	              1987 Lincoln Street<br />
	              Phone: +0 000 000 00 00<br />
	              Fax: +0 000 000 00 00<br />
	              Email: <a href="#">admin@mysite.com</a>
	              </p>
	            </div>
	          </div>
	          <!-- Social icons -->
	          <div class="col-sm-4">
	            <h3 class="text-color"><span>Go Social</span></h3>
	            <div class="content social">
	              <p>Stay in touch with us:</p>
	              <ul class="list-inline">
	                  <li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
	                <li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
	                <li><a href="#" class="pinterest"><i class="fa fa-pinterest"></i></a></li>
	                <li><a href="#" class="github"><i class="fa fa-github"></i></a></li>
	                <li><a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a></li>
	                <li><a href="#" class="vk"><i class="fa fa-vk"></i></a></li>
	                <li><a href="#" class="plus"><i class="fa fa-google-plus"></i></a></li>
	              </ul>
	              <div class="clearfix"></div>
	            </div>
	          </div>
	          <!-- Subscribe -->
	          <div class="col-sm-4">
	            <h3 class="text-color"><span>Subscribe</span></h3>
	            <div class="content">
	              <p>Enter your e-mail below to subscribe to our free newsletter.<br />We promise not to bother you often!</p>
	              <form class="form" role="form">
	                <div class="row">
	                  <div class="col-sm-8">
	                    <div class="input-group">
	                      <label class="sr-only" for="subscribe-email">Email address</label>
	                      <input type="email" class="form-control" id="subscribe-email" placeholder="Enter email">
	                      <span class="input-group-btn">
	                        <button type="submit" class="btn btn-default">OK</button>
	                      </span>
	                    </div>
	                  </div>
	                </div>
	              </form>
	            </div>
	          </div>
	        </div>
	        <div class="row">
	          <div class="col-sm-12">
	            <hr>
	          </div>
	        </div>
	        <!-- Copyrights -->
	        <div class="row">
	          <div class="col-sm-12">
	            <p>&copy; Mosaic 2014. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
	          </div>
	        </div>
	      </div>
	    </footer>
	    
	    <!-- Bootstrap core JavaScript
	    ================================================== -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/mosaic/js/bootstrap.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/mosaic/js/scrolltopcontrol.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/mosaic/js/jquery.sticky.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/mosaic/js/custom.js"></script>
	    
	    <!-- Form plugins -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/validation/jquery.validate.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/select2/select2.js"></script> 
	    
		<!-- FullCalendar plugin -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/fullcalendar/fullcalendar/fullcalendar.js"></script>
		
		<!-- Dotdotdot plugin -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/dotdotdot/src/js/jquery.dotdotdot.min.js"></script>
		
		<!-- Twitter Bootstrap Wizard plugin -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/twitter-bootstrap-wizard/jquery.bootstrap.wizard.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/twitter-bootstrap-wizard/prettify.js"></script>
	     
	    <!-- Init plugins -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/mosaic/js/pages/login.js"></script><!-- Init plugins only for page -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/mosaic/js/pages/form-validation.js"></script><!-- Init plugins only for page -->
	    
	    <!-- Custom JS -->
	    <script src="${pageContext.request.contextPath}/static/js/style.js"></script>

	</body>
</html>