<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="heading" class="page-header">
    <h1><i class="icon20 i-credit"></i> My Account</h1>
</div>

<div class="row">

    <div class="col-lg-12">

        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="icon"><i class="icon20 i-credit"></i></div> 
                <h4>Buy credit</h4>
                <a href="#" class="minimize"></a>
            </div><!-- End .panel-heading -->
        
            <div class="panel-body">

               <form id="wizard" class="form-horizontal" role="form">
	               <div class="msg"></div>
	               <div class="wizard-steps"></div>
	               <div class="step" id="first">
		               <span data-icon="i-package" data-text="Choose package"></span>
		                   <div class="form-group">
			                   <div class="col-lg-12 center">
			                   		 <button type="button" class="btn btn-danger btn-lg">Pay As You Go</button>    
			                         <button type="button" class="btn btn-warning btn-lg">5 Session Package</button>
			                         <button type="button" class="btn btn-success btn-lg">10 Session Package</button>
			                   </div>                                             
		            	   </div>
	               </div>
	               <div class="step submit_step" id="account">
	                   <span data-icon="i-checkmark-circle-2" data-text="Confirm"></span>
		                   <div class="form-group">
		                   <div class="col-lg-2"></div>
		                   	  <div class="col-lg-8">
		                   		<table class="table table-bordered">
	                                <thead>
	                                    <tr>
	                                        <th>Package</th>
	                                        <th>Description</th>
	                                        <th>Price</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td class="center">5 Session Package</td>
	                                        <td class="center">I'm paying for 5 sessions and will use them within one month</td>
	                                        <td class="center">1000</td>
	                                    </tr>
	                                </tbody>
	                            </table>
		                   </div>
		                   <div class="col-lg-2"></div>
	                   </div>
	                 </div>
	               <div class="form-actions full">
	                   <button class="btn pull-left" type="reset"><i class="icon16 i-arrow-left-2"></i>Back</button>
	                   <button class="btn pull-right" type="submit">Next<i class="icon16 i-arrow-right-3"></i></button>
	               </div>
	           </form>
                
                
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
              <span class="border-color">Buy Credit</span>
            </h2>
            

				<div id="rootwizard">
				<div class="navbar">
					  <div class="navbar-inner">
					    <div class="container">
						
						<ul class="nav nav-pills nav-wizard">
					      <li><a href="#tab1" data-toggle="tab">Choose Package</a><div class="nav-arrow"></div></li>
					      <li><div class="nav-wedge"></div><a href="#tab2" data-toggle="tab">Select Credit Amount</a><div class="nav-arrow"></div></li>
					      <li><div class="nav-wedge"></div><a href="#tab3" data-toggle="tab">Confirm</a></li>
					    </ul>
						
					 </div>
				  </div>
				</div>
				<div class="tab-content">
				    <div class="tab-pane" id="tab1">
	                   <div class="packages">
	                   		 <button type="button" class="btn btn-danger">Pay As You Go</button>    
	                         <button type="button" class="btn btn-warning">5 Session Package</button>
	                         <button type="button" class="btn btn-success">10 Session Package</button>
	                   </div>                                             
				    </div>
				    <div class="tab-pane" id="tab2">
				    	<div class="well">
		                   <select class="form-control">
							  <option>100</option>
							  <option>200</option>
							  <option>300</option>
							  <option>400</option>
							  <option>500</option>
							  <option>600</option>
							  <option>700</option>
							  <option>800</option>
							  <option>900</option>
							  <option>1000</option>
							  <option>1500</option>
							  <option>2000</option>
							  <option>5000</option>
							</select>   
						</div>                                        
				    </div>
				    <div class="tab-pane" id="tab3">
				      
						<table class="table table-bordered">
							<thead>
							    <tr>
							        <th>Package</th>
							        <th>Description</th>
							        <th>Price</th>
							    </tr>
							</thead>
							<tbody>
							    <tr>
							        <td>5 Session Package</td>
							        <td>I'm paying for 5 sessions and will use them within one month</td>
							        <td>£ 200</td>
							    </tr>
							</tbody>
						</table>

				    </div>
				</div>
				<ul class="pager wizard">
						<li class="previous"><a href="javascript:;">Previous</a></li>
					  	<li class="next"><a href="#" class="btn btn-color btn">Next</a></li>
						<li class="next finish" style="display:none;"><a href="#" class="btn btn-color btn">Buy</a></li>
				</ul>	
			</div>
			    

        </div>
	</div><!-- / .row -->
</div><!-- / .container -->



	
<script>

$(document).ready(function() {
  	$('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
		var $total = navigation.find('li').length;
		var $current = index+1;
		var $percent = ($current/$total) * 100;
		$('#rootwizard').find('.bar').css({width:$percent+'%'});
		
		// If it's the last tab then hide the last button and show the finish instead
		if($current >= $total) {
			$('#rootwizard').find('.pager .next').hide();
			$('#rootwizard').find('.pager .finish').show();
			$('#rootwizard').find('.pager .finish').removeClass('disabled');
		} else {
			$('#rootwizard').find('.pager .next').show();
			$('#rootwizard').find('.pager .finish').hide();
		}
		
	}});
	$('#rootwizard .finish').click(function() {
		alert('Finished!, Starting over!');
		$('#rootwizard').find("a[href*='tab1']").trigger('click');
	});
});
</script>
	



	

	



