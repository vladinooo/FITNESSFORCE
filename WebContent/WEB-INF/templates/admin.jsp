<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>




<!DOCTYPE html>
	<html lang="en">
	  <head>
	    <meta charset="utf-8">
	    
	    <title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>
	    
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	    <script type="text/javascript">
	        //adding load class to body and hide page only if plugin is active
	        document.documentElement.className += 'loading';
	    </script>
	 
	    <!-- Headings -->
	    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,800,700' rel='stylesheet' type='text/css'>
	    <!-- Text -->
	    <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css' />
	 
	    <!-- Core stylesheets do not remove -->
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/css/bootstrap/bootstrap.css" rel="stylesheet" />
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/css/icons.css" rel="stylesheet" />
	  
    
	    <!-- Plugins stylesheets -->
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/uniform/uniform.default.css" rel="stylesheet" /> 
    	<link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/select2/select2.css" rel="stylesheet" />
	 
	    <!-- app stylesheets -->
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/css/app.css" rel="stylesheet" /> 
	 
	    <!-- Custom stylesheets ( Put your own changes here ) -->
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/css/custom.css" rel="stylesheet" /> 
	    
	    <!-- Force IE9 to render in normal mode -->
	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	 
	    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	    <!--[if lt IE 9]>
	      <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/html5shiv.js"></script>
	      <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/respond.min.js"></script>
	    <![endif]-->
	    
	    
	    <!--[if lt IE 9]>
	    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" type="text/css" />
	    <link href="http://fonts.googleapis.com/css?family=Open+Sans:700" rel="stylesheet" type="text/css" />
	    <link href="http://fonts.googleapis.com/css?family=Open+Sans:800" rel="stylesheet" type="text/css" />
	    <link href="http://fonts.googleapis.com/css?family=Droid+Sans:400" rel="stylesheet" type="text/css" />
	    <link href="http://fonts.googleapis.com/css?family=Droid+Sans:700" rel="stylesheet" type="text/css" />
	    <![endif]-->
	    
	    <!--[if IE 8]><link href="${pageContext.request.contextPath}/static/bootstrap/genyx/css/ie8.css" rel="stylesheet" type="text/css" /><![endif]-->
	 
	    <!-- Fav and touch icons -->
	    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/static/bootstrap/genyx/images/ico/apple-touch-icon-144-precomposed.png">
	    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/static/bootstrap/genyx/images/ico/apple-touch-icon-114-precomposed.png">
	      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/static/bootstrap/genyx/images/ico/apple-touch-icon-72-precomposed.png">
	                    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/static/bootstrap/genyx/images/ico/apple-touch-icon-57-precomposed.png">
	                                   <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/bootstrap/genyx/images/ico/favicon.png">
	 
	    <!-- Le javascript
	    ================================================== -->
	    <!-- Important plugins put in all pages -->
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.0/jquery-ui.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/bootstrap/bootstrap.js"></script>  
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/conditionizr.min.js"></script>  
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/core/nicescroll/jquery.nicescroll.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/core/jrespond/jRespond.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/jquery.genyxAdmin.js"></script>
	    
	 
	    <!-- Form plugins -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/uniform/jquery.uniform.min.js"></script>
    	<script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/validation/jquery.validate.js"></script>
    	<script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/select2/select2.js"></script> 
	 
	    <!-- Init plugins -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/app.js"></script><!-- Core js functions -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/pages/domready.js"></script><!-- Init plugins only for page -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/pages/form-validation.js"></script><!-- Init plugins only for page -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/pages/login.js"></script><!-- Init plugins only for page -->
	    
	    <!-- Custom CSS -->
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
	 
	    </head>
	    
	    <body>
		
			<div>
				<tiles:insertAttribute name="header"></tiles:insertAttribute>
			</div>
		
			<div>
				<tiles:insertAttribute name="content"></tiles:insertAttribute>
			</div>
		
			<div>
				<tiles:insertAttribute name="footer"></tiles:insertAttribute>
			</div>
		
		</body>
		</html>

