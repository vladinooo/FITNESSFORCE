<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="heading" class="page-header">
    <h1><i class="icon20 i-credit"></i> My Account</h1>
</div>

<div class="row">

    <div class="col-lg-12">

        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="icon"><i class="icon20 i-credit"></i></div> 
                <h4>Status</h4>
                <a href="#" class="minimize"></a>
            </div><!-- End .panel-heading -->
        
            <div class="panel-body">

				<div class="row">
					<div class="col-lg-6">
						<div id="dataTable_length" class="dataTables_length">
							<a href="<c:url value='account_topup'/>">
								<button type="submit" class="btn btn-primary">Buy credit</button>
							</a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="stats-buttons col-lg-12 center">
		                 <ul class="list-unstyled">
		                     <li class="center">
		                         <a href="#" class="clearfix">
		                             <span class="icon green"><i class="icon24 i-coin"></i></span>
		                             <span class="number"><small>£</small>2,015</span>
		                             <span class="txt">Current credit</span>
		                         </a>
		                     </li>
		                 </ul>
	             	</div>
				</div>
                
                
            </div><!-- End .panel-body -->
        </div><!-- End .widget -->
                            
    </div><!-- End .col-lg-12  -->                     
                        
</div><!-- End .row-fluid  --> --%>



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
		    <a href="<c:url value='view_profile'/>" class="list-group-item list-group-item-success active" data-parent="#MainMenu">Profile</a>
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
		      <a href="<c:url value='user_orders'/>" class="list-group-item list-group-item-success">- My orders</a>
		    </div>
		  </div>
		</div>


	  
		</div>
		<div class="col-sm-9">
            <h2 class="headline first-child text-color">
              <span class="border-color">Credit Status</span>
            </h2>
            <div class="well">
            	<div class="credit-amount">Current credit: <h1>£1000</h1></div>
            </div>
        </div>
	</div><!-- / .row -->
</div><!-- / .container -->



	

	



	

	



