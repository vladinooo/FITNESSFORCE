<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
	$(".topic").show();
</script>


<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-sm-3">
			  
		  <div id="MainMenu">
			  <div class="list-group panel">
			    <a href="<c:url value='view_profile'/>" class="list-group-item list-group-item-success" data-parent="#MainMenu">Profile</a>
			    <a href="<c:url value='credit'/>" class="list-group-item list-group-item-success" data-parent="#MainMenu">Credit</a>
			    <a href="<c:url value='bookings'/>" class="list-group-item list-group-item-success" data-parent="#MainMenu">Bookings</a>
			    <a href="<c:url value='onlineshop'/>" class="list-group-item list-group-item-success active" data-parent="#MainMenu">Online Shop</a>
			  </div>
		  </div>


	  
		</div>
		<div class="col-sm-9">
		  <h2 class="headline first-child text-color">
				<span class="border-color">Online Shop</span>
			</h2>
			
			<ul class="nav nav-tabs">
				<li class="active"><a href="#addressbook" data-toggle="tab">Address Book</a></li>
				<li><a href="#orders" data-toggle="tab">Orders</a></li>
			</ul>

			<div class="tab-content">
				<div class="tab-pane active" id="addressbook">
					ddd
				</div>
				<div class="tab-pane" id="orders">
					daasd
				</div>
			</div>
		</div>
	</div><!-- / .row -->
</div><!-- / .container -->



	

	