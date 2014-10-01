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
			    <a href="<c:url value='credit'/>" class="list-group-item list-group-item-success active" data-parent="#MainMenu">Credit</a>
			    <a href="<c:url value='bookings'/>" class="list-group-item list-group-item-success" data-parent="#MainMenu">Bookings</a>
			    <a href="<c:url value='onlineshop'/>" class="list-group-item list-group-item-success" data-parent="#MainMenu">Online Shop</a>
			  </div>
		  </div>


	  
		</div>
		<div class="col-sm-9">
            <h2 class="headline first-child text-color">
              <span class="border-color">Credit Status</span>
            </h2>
            
            <ul class="nav nav-tabs">
				<li class="active"><a href="#status" data-toggle="tab">Status</a></li>
				<li><a href="#buy-credit" data-toggle="tab">Buy Credit</a></li>
				<li><a href="#history" data-toggle="tab">History</a></li>
			</ul>

			<div class="tab-content">
				<div class="tab-pane active" id="status">
					<div class="well">
						<div class="credit-amount">
							Current credit:
							<h1>£1000</h1>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="buy-credit">
					<div id="rootwizard">
						<table class="buy-credit-tbl">
							<tr>
								<td>
									<div class="navbar">
										<ul class="nav nav-pills nav-wizard">
											<li><a href="#tab1" data-toggle="tab">Choose Package</a><div class="nav-arrow"></div></li>
											<li><div class="nav-wedge"></div><a href="#tab2" data-toggle="tab">Select Credit Amount</a><div class="nav-arrow"></div></li>
											<li><div class="nav-wedge"></div><a href="#tab3" data-toggle="tab">Confirm</a></li>
										</ul>
									</div>
								</td>
							</tr>
							<tr class="buy-credit-tbl-tr-body">
								<td>
									<div class="tab-content">
										<div class="tab-pane" id="tab1">
											<div class="packages">
												<button type="button" class="btn btn-danger btn-lg">Pay As You Go</button>
												<button type="button" class="btn btn-warning btn-lg">5 Session Package</button>
												<button type="button" class="btn btn-success btn-lg">10 Session Package</button>
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
								</td>
							</tr>
							<tr>
								<td>
									<ul class="pager wizard">
										<li class="previous"><a href="javascript:;">Previous</a></li>
										<li class="next"><a href="#" class="btn btn-color btn">Next</a></li>
										<li class="next finish" style="display: none;"><a href="#" class="btn btn-color btn">Buy</a></li>
									</ul>
								</td>
							</tr>
						</table>
					</div>
					<!-- End of rootwizard -->
				</div>
				<div class="tab-pane" id="history">
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

	



	

	



