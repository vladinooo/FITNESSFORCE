<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<header id="header">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <button type="button" class="navbar-toggle btn-danger" data-toggle="collapse" data-target="#navbar-to-collapse">
            <span class="sr-only">Toggle right menu</span>
            <i class="icon16 i-arrow-8"></i>
        </button>          
        <div class="collapse navbar-collapse" id="navbar-to-collapse">  
            <ul class="nav navbar-nav pull-right">
                <li class="divider-vertical"></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon24 i-bell-2"></i>
                        <span class="notification red">6</span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li role="presentation"><a href="#" class=""><i class="icon16 i-calendar-2"></i> Admin Jenny add event</a></li>
                        <li role="presentation"><a href="#" class=""><i class="icon16 i-file-zip"></i> User Dexter attach file</a></li>
                        <li role="presentation"><a href="#" class=""><i class="icon16 i-stack-picture"></i> User Dexter attach 3 pictures</a></li>
                        <li role="presentation"><a href="#" class=""><i class="icon16 i-cart-add"></i> New orders <span class="notification green">2</span></a></li>
                        <li role="presentation"><a href="#" class=""><i class="icon16 i-bubbles-2"></i> New comments <span class="notification red">5</span></a></li>
                        <li role="presentation"><a href="#" class=""><i class="icon16 i-pie-5"></i> Daily stats is generated</a></li>
                    </ul>
                </li>
                <li class="divider-vertical"></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon24 i-envelop-2"></i>
                        <span class="notification red">3</span>
                    </a>
                    <ul class="dropdown-menu messages" role="menu">
                        <li class="head" role="presentation">
                            <h4>Inbox</h4>
                            <span class="count">3 messages</span>
                            <span class="new-msg"><a href="#" class="tipB" title="Write message"><i class="icon16 i-pencil-5"></i></a></span>
                        </li>
                        <li role="presentation">
                            <a href="#" class="clearfix">
                                <span class="avatar"><img src="images/avatars/peter.jpg" alt="avatar"></span>
                                <span class="msg">Call me i need to talk with you</span>
                                <button class="btn close"><i class="icon12 i-close-2"></i></button>
                            </a>
                        </li>
                        <li role="presentation">
                            <a href="#" class="clearfix">
                                <span class="avatar"><img src="images/avatars/milen.jpg" alt="avatar"></span>
                                <span class="msg">Problem with registration</span>
                                <button class="btn close"><i class="icon12 i-close-2"></i></button>
                            </a>
                        </li>
                        <li role="presentation">
                            <a href="#" class="clearfix">
                                <span class="avatar"><img src="images/avatars/anonime.jpg" alt="avatar"></span>
                                <span class="msg">I have question about ...</span>
                                <button class="btn close"><i class="icon12 i-close-2"></i></button>
                            </a>
                        </li>
                        <li class="foot" role="presentation"><a href="email.html">View all messages</a></li>
                    </ul>
                </li>
                <li class="divider-vertical"></li>
                <li class="dropdown user">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                 		<i class="icon24 i-exit-2"></i>
                        <span class="more"><i class="icon16 i-arrow-down-2"></i></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li role="presentation"><a href="#" class=""><i class="icon16 i-cogs"></i> Settings</a></li>
                        <li role="presentation"><a href="profile.html" class=""><i class="icon16 i-user"></i> Profile</a></li>
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
                        <a href="<c:url value='/dashboard'/>">
                            <span class="icon"><i class="icon20 i-screen"></i></span>
                            <span class="txt">Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="#users">
                            <span class="icon"><i class="icon20 i-users"></i></span>
                            <span class="txt">Users</span>
                        </a>
                        <ul class="sub">
                            <li>
                                <a href="<c:url value='/add_user'/>">
                                    <span class="icon"><i class="icon20 i-user-plus"></i></span>
                                    <span class="txt">Add user</span>
                                </a>
                            </li>
                            <li>
                                <a href="<c:url value='/show_all_users'/>">
                                    <span class="icon"><i class="icon20 i-users"></i></span>
                                    <span class="txt">Show all</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#tables">
                            <span class="icon"><i class="icon20 i-table-2"></i></span>
                            <span class="txt">Tables</span>
                        </a>
                        <ul class="sub">
                            <li>
                                <a href="tables.html">
                                    <span class="icon"><i class="icon20 i-table"></i></span>
                                    <span class="txt">Static tables</span>
                                </a>
                            </li>
                            <li>
                                <a href="data-tables.html">
                                    <span class="icon"><i class="icon20 i-table"></i></span>
                                    <span class="txt">Data tables</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="grid.html">
                            <span class="icon"><i class="icon20 i-grid-5"></i></span>
                            <span class="txt">Grid</span>
                        </a>
                    </li>
                    <li>
                        <a href="typo.html">
                            <span class="icon"><i class="icon20 i-font"></i></span>
                            <span class="txt">Typography</span>
                        </a>
                    </li>
                    <li>
                        <a href="calendar.html">
                            <span class="icon"><i class="icon20 i-calendar"></i></span>
                            <span class="txt">Calendar</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="icon"><i class="icon20 i-cogs"></i></span>
                            <span class="txt">Ui Elements</span>
                        </a>
                        <ul class="sub">
                            <li>
                                <a href="icons.html">
                                    <span class="icon"><i class="icon20 i-IcoMoon"></i></span>
                                    <span class="txt">Icons</span>
                                </a>
                            </li>
                            <li>
                                <a href="buttons.html">
                                    <span class="icon"><i class="icon20 i-point-up"></i></span>
                                    <span class="txt">Buttons</span>
                                </a>
                            </li>
                            <li>
                                <a href="ui-elements.html">
                                    <span class="icon"><i class="icon20 i-puzzle"></i></span>
                                    <span class="txt">UI Elements</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="gallery.html">
                            <span class="icon"><i class="icon20 i-images"></i></span>
                            <span class="txt">Gallery</span>
                        </a>
                    </li>
                    <li>
                        <a href="maps.html">
                            <span class="icon"><i class="icon20 i-location-4"></i></span>
                            <span class="txt">Maps</span>
                            <span class="notification green">6</span>
                        </a>
                    </li>
                    <li>
                        <a href="file-manager.html">
                            <span class="icon"><i class="icon20 i-cloud-upload"></i></span>
                            <span class="txt">File manager</span>
                        </a>
                    </li>
                    <li>
                        <a href="widgets.html">
                            <span class="icon"><i class="icon20 i-cube-3"></i></span>
                            <span class="txt">Widgets</span>
                            <span class="notification">26</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="icon"><i class="icon20 i-file-8"></i></span>
                            <span class="txt">Pages</span>
                        </a>
                        <ul class="sub">
                            <li>
                                <a href="#">
                                    <span class="icon"><i class="icon20 i-warning"></i></span>
                                    <span class="txt">Error Pages</span>
                                </a>
                                <ul class="sub">
                                    <li>
                                        <a href="403.html">
                                            <span class="icon"><i class="icon20 i-notification"></i></span>
                                            <span class="txt">Error 403</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="404.html">
                                            <span class="icon"><i class="icon20 i-notification"></i></span>
                                            <span class="txt">Error 404</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="405.html">
                                            <span class="icon"><i class="icon20 i-notification"></i></span>
                                            <span class="txt">Error 405</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="500.html">
                                            <span class="icon"><i class="icon20 i-notification"></i></span>
                                            <span class="txt">Error 500</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="503.html">
                                            <span class="icon"><i class="icon20 i-notification"></i></span>
                                            <span class="txt">Error 503</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="offline.html">
                                            <span class="icon"><i class="icon20 i-notification"></i></span>
                                            <span class="txt">Offline page</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="invoice.html">
                                    <span class="icon"><i class="icon20 i-credit"></i></span>
                                    <span class="txt">Invoice page</span>
                                </a>
                            </li>
                            <li>
                                <a href="profile.html">
                                    <span class="icon"><i class="icon20 i-user"></i></span>
                                    <span class="txt">Profile page</span>
                                </a>
                            </li>
                            <li>
                                <a href="search.html">
                                    <span class="icon"><i class="icon20 i-search-2"></i></span>
                                    <span class="txt">Search page</span>
                                </a>
                            </li>
                            <li>
                                <a href="email.html">
                                    <span class="icon"><i class="icon20 i-envelop-2"></i></span>
                                    <span class="txt">Email page</span>
                                </a>
                            </li>
                            <li>
                                <a href="faq.html">
                                    <span class="icon"><i class="icon20 i-question"></i></span>
                                    <span class="txt">FAQ page</span>
                                </a>
                            </li>
                            <li>
                                <a href="blank.html">
                                    <span class="icon"><i class="icon20 i-file-7"></i></span>
                                    <span class="txt">Blank page</span>
                                </a>
                            </li>
                        </ul>
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
                <div id="heading" class="page-header">
                    <h1><i class="icon20 i-dashboard"></i> Dashboard</h1>
                </div>
                


   

            </div> <!-- End .container-fluid  -->
        </div> <!-- End .wrapper  -->
    </section>
</div><!-- End .main  -->
 
<!--     
<sec:authorize access="hasRole('ROLE_ADMIN')">
<p><a href="<c:url value='/admin'/>">Admin</a></p>
</sec:authorize> -->
