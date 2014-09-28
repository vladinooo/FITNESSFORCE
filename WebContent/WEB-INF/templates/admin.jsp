<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


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
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/css/genyx-theme/jquery.ui.genyx.css" rel="stylesheet" />
	  
    
	    <!-- Plugins stylesheets -->
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/uniform/uniform.default.css" rel="stylesheet" /> 
    	<link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/select2/select2.css" rel="stylesheet" />
    	<link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/ui/jgrowl/jquery.jgrowl.css" rel="stylesheet" /> 
    	<link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/tables/datatables/jquery.dataTables.css" rel="stylesheet" />
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/ui/range-slider/rangeslider.css" rel="stylesheet" /> 
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/switch/bootstrapSwitch.css" rel="stylesheet" /> 
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/spectrum/spectrum.css" rel="stylesheet" /> 
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/datepicker/datepicker.css" rel="stylesheet" /> 
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/multiselect/ui.multiselect.css" rel="stylesheet" /> 
	    <link href="${pageContext.request.contextPath}/static/plugins/jquery-timepicker/jquery.timepicker.css" rel="stylesheet" />
	    <link href="${pageContext.request.contextPath}/static/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
	    <link href="${pageContext.request.contextPath}/static/plugins/jquery-color-picker/jquery.colorpicker.css" rel="stylesheet" />
	    <link href="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/upload/elfinder/elfinder.min.css" rel="stylesheet" />


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
	    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/bootstrap/bootstrap.js"></script>  
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/conditionizr.min.js"></script>  
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/core/nicescroll/jquery.nicescroll.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/core/jrespond/jRespond.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/jquery.genyxAdmin.js"></script>
	    

	    <!-- Charts plugins -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/charts/flot/jquery.flot.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/charts/flot/jquery.flot.pie.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/charts/flot/jquery.flot.resize.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/charts/flot/jquery.flot.tooltip.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/charts/flot/jquery.flot.orderBars.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/charts/flot/jquery.flot.time.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/charts/sparklines/jquery.sparkline.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/charts/flot/date.js"></script> <!-- Only for generating random data delete in production site-->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/charts/pie-chart/jquery.easy-pie-chart.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/charts/gauge/justgage.1.0.1.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/charts/gauge/raphael.2.1.0.min.js"></script>
	    
	 
	    <!-- Form plugins -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/uniform/jquery.uniform.min.js"></script>
    	<script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/validation/jquery.validate.js"></script>
    	<script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/select2/select2.js"></script> 
    	<script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/tables/datatables/jquery.dataTables.min.js"></script>
    	<script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/jquery.mousewheel.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/autosize/jquery.autosize-min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/inputlimit/jquery.inputlimiter.1.3.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/mask/jquery.mask.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/switch/bootstrapSwitch.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/globalize/globalize.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/spectrum/spectrum.js"></script><!--  Color picker -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/datepicker/bootstrap-datepicker.js"></script> 
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/multiselect/ui.multiselect.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/tinymce/tinymce.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/plugins/jquery-timepicker/jquery.timepicker.min.js"></script>
	    <script src="${pageContext.request.contextPath}/static/plugins/jquery-color-picker/jquery.colorpicker.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/wizard/jquery.form.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/wizard/jquery.form.wizard.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/forms/validation/jquery.validate.js"></script>
	    
	    
	    <!-- kceditor plugin -->
	    <script src="${pageContext.request.contextPath}/static/plugins/ckeditor/ckeditor.js"></script>
	    
	    <!-- elfinder plugin -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/upload/elfinder/elfinder.min.js"></script>

	    
	    <!-- FullCalendar plugin -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/fullcalendar/fullcalendar/fullcalendar.js"></script>
	
	    <!-- UI plugins -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/ui/range-slider/rangeslider-ruler.js"></script>
    	<script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/ui/animated-progress-bar/jquery.progressbar.js"></script>
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/plugins/ui/jgrowl/jquery.jgrowl.min.js"></script>
	 
	    <!-- Init plugins -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/app.js"></script><!-- Core js functions -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/pages/domready.js"></script><!-- Init plugins only for page -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/pages/form-validation.js"></script><!-- Init plugins only for page -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/pages/login.js"></script><!-- Init plugins only for page -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/pages/dashboard.js"></script><!-- Init plugins only for page -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/pages/data-tables.js"></script><!-- Init plugins only for page -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/pages/ui-elements.js"></script><!-- Init plugins only for page -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/pages/form-elements.js"></script><!-- Init plugins only for page -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/pages/file-manager.js"></script><!-- Init plugins only for page -->
	    <script src="${pageContext.request.contextPath}/static/bootstrap/genyx/js/pages/form-wizard.js"></script><!-- Init plugins only for page -->
	    
	    
	    <!-- Custom CSS -->
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
	    
	    <!-- Custom JS -->
	    <script src="${pageContext.request.contextPath}/static/js/style.js"></script>
	 
	    </head>
	    
	    <body>
				
		<header id="header">
		    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		        <button type="button" class="navbar-toggle btn-danger" data-toggle="collapse" data-target="#navbar-to-collapse">
		            <span class="sr-only">Toggle right menu</span>
		            <i class="icon16 i-arrow-8"></i>
		        </button>          
		        <div class="collapse navbar-collapse" id="navbar-to-collapse">  
		            <ul class="nav navbar-nav pull-right">
		                <li class="divider-vertical"></li>
		                <li class="dropdown user">
		                     <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		                 		<i class="icon24 i-exit-2"></i>
		                        <span class="more"><i class="icon16 i-arrow-down-2"></i></span>
		                    </a>
		                    <ul class="dropdown-menu" role="menu">
		                        <li role="presentation"><a href="#" class=""><i class="icon16 i-question"></i> Help</a></li>
		                        <li role="presentation"><a href="<c:url value='/j_spring_security_logout'/>" class=""><i class="icon16 i-exit"></i> Logout</a></li>
		                    </ul>
		                </li>
		                <li class="divider-vertical"></li>
		            </ul>
		        </div><!--/.nav-collapse -->
		    </nav>
		</header> <!-- End #header  -->
		
		<div class="main">
		    <aside id="sidebar">
		        <div class="side-options">
		            <ul class="list-unstyled">
		                <li>
		                    <a href="#" id="collapse-nav" class="act act-primary tip" title="Collapse navigation">
		                        <i class="icon16 i-arrow-left-7"></i>
		                    </a>
		                </li>
		            </ul>
		        </div>
		
		        <div class="sidebar-wrapper">
		            <nav id="mainnav">
		                <ul class="nav nav-list">
		                    <li>
		                        <a href="<c:url value='dashboard'/>">
		                            <span class="icon"><i class="icon20 i-screen"></i></span>
		                            <span class="txt">Dashboard</span>
		                        </a>
		                    </li>
		                    <li>
		                        <a href="<c:url value='admin_timetable'/>">
		                            <span class="icon"><i class="icon20 icon20 i-calendar"></i></span>
		                            <span class="txt">Timetable</span>
		                        </a>
		                    </li> 
							<li id="articlesTab">
		                        <a href="#">
		                            <span class="icon"><i class="icon20 i-stack-list"></i></span>
		                            <span class="txt">Articles</span>
		                        </a>
		                        <ul class="sub">
		                            <li>
		                                <a href="<c:url value='create_article'/>">
		                                    <span class="icon"><i class="icon20 i-stack-plus"></i></span>
		                                    <span class="txt">Add new</span>
		                                </a>
		                            </li>
		                            <li>
		                                <a href="<c:url value='articles'/>">
		                                    <span class="icon"><i class="icon20 i-stack-list"></i></span>
		                                    <span class="txt">All articles</span>
		                                </a>
		                            </li>
		                        </ul>
		                    </li>
		                    <li>
		                        <a href="<c:url value='filemanager'/>">
		                            <span class="icon"><i class="icon20 i-cloud-upload"></i></span>
		                            <span class="txt">Media library</span>
		                        </a>
		                    </li>
		                    <li>
		                        <a href="#">
		                            <span class="icon"><i class="icon20 i-cart-6"></i></span>
		                            <span class="txt">Online Shop</span>
		                        </a>
		                    </li>
							<li id="usersTab">
			                        <a href="#">
			                            <span class="icon"><i class="icon20 i-users"></i></span>
			                            <span class="txt">Users</span>
			                        </a>
			                        <ul class="sub">
			                            <li>
			                                <a href="<c:url value='admin_create_user'/>">
			                                    <span class="icon"><i class="icon20 i-user-plus"></i></span>
			                                    <span class="txt">Add new</span>
			                                </a>
			                            </li>
			                            <li>
			                                <a href="<c:url value='users'/>">
			                                    <span class="icon"><i class="icon20 i-users"></i></span>
			                                    <span class="txt">All users</span>
			                                </a>
			                            </li>
			                        </ul>
			                    </li>
			                    <li>
			                        <a href="#">
			                            <span class="icon"><i class="icon20 i-cogs"></i></span>
			                            <span class="txt">Settings</span>
			                        </a>
			                    </li> 
		                </ul>
		            </nav> <!-- End #mainnav -->
		
		
		        </div> <!-- End .sidebar-wrapper  -->
		    </aside><!-- End #sidebar  -->
		
		    <section id="content">
		        <div class="wrapper">
		            <div class="crumb">
		                
		            </div>
		            
		            <div class="container-fluid">
		            
						
						<tiles:insertAttribute name="content"></tiles:insertAttribute>
					
					
					</div> <!-- End .container-fluid  -->
				
				</div> <!-- End .wrapper  -->
			</section>
		</div><!-- End .main  -->
</body>
</html>
