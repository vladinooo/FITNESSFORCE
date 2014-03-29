<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/bootstrap/mosaic/img/favicon.png?v=2">
		
		<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>
	
	    <!-- Bootstrap core CSS -->
	    <link href="${pageContext.request.contextPath}/static/bootstrap/mosaic/css/bootstrap.css" rel="stylesheet">
	    
	    <!-- Plugins stylesheets -->
    	<link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/select2/select2.css" rel="stylesheet" />
    		
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
	         	<a href="${pageContext.request.contextPath}/create_user" class="pull-right"><i class="fa fa-arrow-circle-down"></i> Create Account</a>
	         	<a href="${pageContext.request.contextPath}/login" class="pull-right"><i class="fa fa-sign-in"></i> Log In</a>
			  </sec:authorize>
			
			  <sec:authorize access="isAuthenticated()">
				<a href="${pageContext.request.contextPath}/dashboard" class="pull-right"><i class="fa fa-user"></i> My Account</a>
	         	<a href="${pageContext.request.contextPath}/j_spring_security_logout" class="pull-right"><i class="fa fa-sign-out"></i> Log Out</a>
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
	          <div class="ff-logo"><a href="index.html"></a></div>
	        </div> <!-- / Navbar Header -->
	
	        <!-- Navbar Links -->
	        <div class="navbar-collapse collapse">
	          <ul class="nav navbar-nav navbar-right">
	            <li class="active"><a href="index.html" class="bg-hover-color">Home</a></li>
	            <li class="dropdown">
	              <a href="#" class="dropdown-toggle bg-hover-color" data-toggle="dropdown">Pages <b class="caret"></b></a>
	              <ul class="dropdown-menu">
	                <li><a href="about-us.html" class="bg-hover-color">About Us</a></li>
	                <li><a href="coming-soon.html" class="bg-hover-color">Coming Soon</a></li>
	                <li><a href="contact-us.html" class="bg-hover-color">Contact Us</a></li>
	                <li><a href="dummy.html" class="bg-hover-color">Dummy Page</a></li>
	                <li><a href="help-center.html" class="bg-hover-color">Help Center</a></li>
	                <li><a href="help-answer.html" class="bg-hover-color">Help Item</a></li>
	                <li><a href="pricing-table.html" class="bg-hover-color">Pricing Table</a></li>
	                <li><a href="responsive-video.html" class="bg-hover-color">Responsive Video</a></li>
	                <li><a href="services.html" class="bg-hover-color">Services</a></li>
	                <li><a href="sign-in.html" class="bg-hover-color">Sign In</a></li>
	                <li><a href="sign-in-alt.html" class="bg-hover-color">Sign In Option</a></li>
	                <li><a href="sign-up.html" class="bg-hover-color">Sign Up</a></li>
	                <li><a href="sign-up-alt.html" class="bg-hover-color">Sign Up Option</a></li>
	                <li><a href="404-error.html" class="bg-hover-color">404 Error Page</a></li>
	              </ul>
	            </li>
	            <li class="dropdown">
	              <a href="#" class="dropdown-toggle bg-hover-color" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
	              <ul class="dropdown-menu">
	                <li><a href="portfolio.html" class="bg-hover-color">Portfolio</a></li>
	                <li><a href="portfolio-isotope.html" class="bg-hover-color">Portfolio Isotope</a></li>
	                <li><a href="portfolio-item.html" class="bg-hover-color">Portfolio Item</a></li>
	              </ul>
	            </li>
	            <li class="dropdown">
	              <a href="#" class="dropdown-toggle bg-hover-color" data-toggle="dropdown">Blog <b class="caret"></b></a>
	              <ul class="dropdown-menu">
	                <li><a href="blog.html" class="bg-hover-color">Blog</a></li>
	                <li><a href="blog-post.html" class="bg-hover-color">Blog Post</a></li>
	              </ul>
	            </li>
	            <li class="dropdown">
	              <a href="#" class="dropdown-toggle bg-hover-color" data-toggle="dropdown">Shop <b class="caret"></b></a>
	              <ul class="dropdown-menu">
	                <li><a href="shop.html" class="bg-hover-color">Shop Index</a></li>
	                <li><a href="shop-products.html" class="bg-hover-color">Shop Products</a></li>
	                <li><a href="shop-item.html" class="bg-hover-color">Shop Item</a></li>
	                <li><a href="shop-cart.html" class="bg-hover-color">Shopping Cart</a></li>
	                <li><a href="user-profile.html" class="bg-hover-color">User Profile</a></li>
	              </ul>
	            </li>
	            <li class="dropdown">
	              <a href="#" class="dropdown-toggle bg-hover-color" data-toggle="dropdown">UI Elements <b class="caret"></b></a>
	              <ul class="dropdown-menu">
	                <li><a href="ui-elements.html#buttons" class="bg-hover-color">Buttons</a></li>
	                <li><a href="ui-elements.html#panels" class="bg-hover-color">Panels</a></li>
	                <li><a href="ui-elements.html#info-boards" class="bg-hover-color">Info Boards</a></li>
	                <li><a href="ui-elements.html#navs" class="bg-hover-color">Navs</a></li>
	                <li><a href="ui-elements.html#headlines" class="bg-hover-color">Headlines</a></li>
	              </ul>
	            </li>
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
	    <!-- Placed at the end of the document so the pages load faster -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/mosaic/js/bootstrap.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/mosaic/js/scrolltopcontrol.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/mosaic/js/jquery.sticky.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/mosaic/js/custom.js"></script>
	    
	    <!-- Form plugins -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/validation/jquery.validate.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/select2/select2.js"></script> 
	     
	    <!-- Init plugins -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/mosaic/js/pages/login.js"></script><!-- Init plugins only for page -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/mosaic/js/pages/form-validation.js"></script><!-- Init plugins only for page -->
	    
	    <!-- Custom JS -->
	    <script src="${pageContext.request.contextPath}/static/js/style.js"></script>

	</body>
</html>