<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="heading" class="page-header">
    <h1><i class="icon20 i-credit"></i> My Account</h1>
</div>

<div class="row">

    <div class="col-lg-12">

        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="icon"><i class="icon20 i-history"></i></div> 
                <h4>History</h4>
                <a href="#" class="minimize"></a>
            </div><!-- End .panel-heading -->
        
            <div class="panel-body">

				<table cellpadding="0" cellspacing="0" border="0" class="table table-bordered table-hover" id="dataTable">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Session package</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
						<tr>
							<td class="center">27/09/2014</td>
							<td class="center">5 Session package</td>
							<td class="center">1000</td>
						</tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Date</th>
                            <th>Session package</th>
                            <th>Price</th>
                        </tr>
                    </tfoot>
                </table>
                
                
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
              <span class="border-color">Credit History</span>
            </h2>
            
            <table class="table table-bordered">
				<thead>
				    <tr>
				    	<th>Purchased</th>
				        <th>Package</th>
				        <th>Description</th>
				        <th>Price</th>
				    </tr>
				</thead>
				<tbody>
				    <tr>
				    	<td>01/09/2014</td>
				        <td>5 Session Package</td>
				        <td>I payed for 5 sessions and will use them within one month</td>
				        <td>£ 200</td>
				    </tr>
				    <tr>
				    	<td>12/09/2014</td>
				        <td>10 Session Package</td>
				        <td>I payed for 10 lessons and will use them within two months</td>
				        <td>£ 350</td>
				    </tr>
				    <tr>
				    	<td>17/09/2014</td>
				        <td>Pay As You Go</td>
				        <td>I payed £500 to my virtual purse</td>
				        <td>£ 500</td>
				    </tr>
				</tbody>
			</table>
			
        </div>
	</div><!-- / .row -->
</div><!-- / .container -->



	

	



	

	



