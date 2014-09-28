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
		    <a href="<c:url value='profile_photo'/>" class="list-group-item list-group-item-success" data-parent="#MainMenu">Photo</a>
		    <a href="<c:url value='view_user'/>" class="list-group-item list-group-item-success" data-parent="#MainMenu">Account</a>
		    <a href="#credit" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Credit</a>
		    <div class="collapse submenu" id="credit">
		      <a href="<c:url value='credit_status'/>" class="list-group-item list-group-item-success">- Status</a>
		      <a href="<c:url value='credit_topup'/>" class="list-group-item list-group-item-success">- Buy credit</a>
		      <a href="<c:url value='credit_history'/>" class="list-group-item list-group-item-success">- History</a>
		    </div>
		    <a href="#bookings" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Bookings</a>
		    <div class="collapse submenu" id="bookings">
		      <a href="<c:url value='bookings_schedule'/>" class="list-group-item list-group-item-success">- Schedule</a>
		      <a href="<c:url value='bookings_history'/>" class="list-group-item list-group-item-success">- History</a>
		    </div>
		    <a href="#onlineshop" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">Online Shop</a>
		    <div class="collapse submenu" id="onlineshop">
		      <a href="<c:url value='user_addressbook'/>" class="list-group-item list-group-item-success">- Address book</a>
		      <a href="<c:url value='user_orders'/>" class="list-group-item list-group-item-success active">- My orders</a>
		    </div>
		    <a href="<c:url value='user_settings'/>" class="list-group-item list-group-item-success" data-parent="#MainMenu">Settings</a>
		  </div>
		</div>


	  
		</div>
		<div class="col-sm-9">
		  <div class="row">
		  		<div class="well"></div>
		  </div> <!-- / .row -->
		</div>
	</div><!-- / .row -->
</div><!-- / .container -->



	

	