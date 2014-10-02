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
					<div class="col-sm-6 billing-address-view">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Billing Address</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										Mr. Usain Bolt <br />
										49 Featherstone Street <br />
										LONDON <br />
										EC1Y 8SY <br />
										UNITED KINGDOM
									</td>
								</tr>
								<tr>
									<td>
										<a href="#" class="btn btn-color btn" onclick="editBillingAddress()">Edit</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-sm-6 shipping-address-view">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Shipping Address</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										Mr. Lewis Luis <br />
										49 Some Street <br />
										BRIGHTON <br />
										BN1 8BC <br />
										UNITED KINGDOM
									</td>
								</tr>
								<tr>
									<td>
										<a href="#" class="btn btn-color btn" onclick="editShippingAddress()">Edit</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane" id="orders">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Order #</th>
								<th>Date</th>
								<th>Ship To</th>
								<th>Total</th>
								<th>Status</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>100001093</td>
								<td>14/08/2014</td>
								<td>Mr. Usain Bolt</td>
								<td>£22.50</td>
								<td>Complete</td>
								<td align="center"><a href="#" class="link-color">View Order</a></td>
							</tr>
							<tr>
								<td>100001094</td>
								<td>17/08/2014</td>
								<td>Mr. Usain Bolt</td>
								<td>£14.50</td>
								<td>Cancelled</td>
								<td align="center"><a href="#" class="link-color">View Order</a></td>
							</tr>
							<tr>
								<td>100001095</td>
								<td>20/09/2014</td>
								<td>Mr. Lewis Luis</td>
								<td>£106.50</td>
								<td>Complete</td>
								<td align="center"><a href="#" class="link-color">View Order</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div><!-- / .row -->
</div><!-- / .container -->

<div class="col-sm-6 billing-address-edit" style="display:none;">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Edit Billing Address</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<div class="form-group">
						<label for="name">Full Name</label>
						<input type="text" class="form-control" id="name">
					</div>
					<div class="form-group">
						<label for="street">Street</label>
						<input type="text" class="form-control" id="street">
					</div>
					<div class="form-group">
						<label for="city-town">City/Town</label>
						<input type="text" class="form-control" id="city-town">
					</div>
					<div class="form-group">
						<label for="postcode">Postcode</label>
						<input type="text" class="form-control" id="postcode">
					</div>
					<div class="form-group">
						<label for="country">Country</label>
						<input type="text" class="form-control" id="country">
					</div>
				</td>
			</tr>
			<tr>
				<td><a href="#" class="btn btn-color btn" onclick="saveBillingAddress()">Save</a></td>
			</tr>
		</tbody>
	</table>
</div>

<div class="col-sm-6 shipping-address-edit" style="display:none;">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Edit Shipping Address</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<div class="form-group">
						<label for="name">Full Name</label>
						<input type="text" class="form-control" id="name">
					</div>
					<div class="form-group">
						<label for="street">Street</label>
						<input type="text" class="form-control" id="street">
					</div>
					<div class="form-group">
						<label for="city-town">City/Town</label>
						<input type="text" class="form-control" id="city-town">
					</div>
					<div class="form-group">
						<label for="postcode">Postcode</label>
						<input type="text" class="form-control" id="postcode">
					</div>
					<div class="form-group">
						<label for="country">Country</label>
						<input type="text" class="form-control" id="country">
					</div>
				</td>
			</tr>
			<tr>
				<td><a href="#" class="btn btn-color btn" onclick="saveShippingAddress()">Save</a></td>
			</tr>
		</tbody>
	</table>
</div>


<script>
function editBillingAddress() {
	var addressViewClone = $("<div class='billing-address-view-clone' style='display:none'></div>");
	$(addressViewClone).append($(".billing-address-view").clone());
	$("body").append(addressViewClone);
	$(".tab-content .billing-address-view").replaceWith($(".billing-address-edit"));
	$(".billing-address-edit").show();
	if ($(".billing-address-edit-clone")) $(".billing-address-edit-clone").remove();
}

function saveBillingAddress() {
	var addressEditClone = $("<div class='billing-address-edit-clone' style='display:none'></div>");
	$(addressEditClone).append($(".billing-address-edit").clone());
	$("body").append(addressEditClone);
	$(".tab-content .billing-address-edit").replaceWith($(".billing-address-view-clone").children());
	if ($(".billing-address-view-clone")) $(".billing-address-view-clone").remove();
}

function editShippingAddress() {
	var addressViewClone = $("<div class='shipping-address-view-clone' style='display:none'></div>");
	$(addressViewClone).append($(".shipping-address-view").clone());
	$("body").append(addressViewClone);
	$(".tab-content .shipping-address-view").replaceWith($(".shipping-address-edit"));
	$(".shipping-address-edit").show();
	if ($(".shipping-address-edit-clone")) $(".shipping-address-edit-clone").remove();
}

function saveShippingAddress() {
	var addressEditClone = $("<div class='shipping-address-edit-clone' style='display:none'></div>");
	$(addressEditClone).append($(".shipping-address-edit").clone());
	$("body").append(addressEditClone);
	$(".tab-content .shipping-address-edit").replaceWith($(".shipping-address-view-clone").children());
	if ($(".shipping-address-view-clone")) $(".shipping-address-view-clone").remove();
}
</script>


