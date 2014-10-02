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
			    <a href="<c:url value='bookings'/>" class="list-group-item list-group-item-success active" data-parent="#MainMenu">Bookings</a>
			    <a href="<c:url value='onlineshop'/>" class="list-group-item list-group-item-success" data-parent="#MainMenu">Online Shop</a>
			  </div>
		  </div>


	  
		</div>
		<div class="col-sm-9">
			<h2 class="headline first-child text-color">
				<span class="border-color">Bookings</span>
			</h2>
			
			<ul class="nav nav-tabs">
				<li class="active"><a href="#schedule" data-toggle="tab">Schedule</a></li>
				<li><a href="#history" data-toggle="tab">History</a></li>
			</ul>

			<div class="tab-content">
				<div class="tab-pane active" id="schedule">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Session</th>
								<th>Place</th>
								<th>Date and Time</th>
								<th>Duration</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Running</td>
								<td>Hide Park</td>
								<td>20/11/2014 16:00</td>
								<td>2h</td>
								<td>Booked</td>
							</tr>
							<tr>
								<td>Fitness</td>
								<td>Leisure Centre</td>
								<td>12/11/2014 08:00</td>
								<td>1h</td>
								<td>Booked</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="tab-pane" id="history">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Session</th>
								<th>Place</th>
								<th>Date and Time</th>
								<th>Duration</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Swimming</td>
								<td>Swimming Arena</td>
								<td>17/11/2014 14:00</td>
								<td>1h</td>
								<td>Cancelled by Coach</td>
							</tr>
							<tr>
								<td>Crossfit</td>
								<td>Leisure Centre</td>
								<td>15/11/2014 10:00</td>
								<td>1h</td>
								<td>Cancelled by User</td>
							</tr>
							<tr>
								<td>Swimming</td>
								<td>Swimming Arena</td>
								<td>09/11/2014 10:00</td>
								<td>1h</td>
								<td>Completed</td>
							</tr>
							<tr>
								<td>Running</td>
								<td>Hide Park</td>
								<td>08/11/2014 12:00</td>
								<td>2h</td>
								<td>Completed</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div><!-- / .row -->
</div><!-- / .container -->



	

	