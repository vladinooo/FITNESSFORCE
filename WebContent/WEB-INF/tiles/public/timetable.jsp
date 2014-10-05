<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
	$(".topic").show();
</script>


<script>

$(document).ready(function() {
	
	/* initialize the calendar
	-----------------------------------------------------------------*/
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		allDaySlot: false,
		defaultView: 'agendaWeek',
		defaultEventMinutes: 60,
		axisFormat: 'HH:mm',
		minTime: '08:00:00',
		maxTime: '23:00:00',
		firstDay: 1,
		height: 734,
		eventBackgroundColor: '#e37777',
	    events: {
	        url: '<c:url value="/get_sessions" />',
	        type: 'POST',
	        error: function() {
	            alert('there was an error while fetching events!');
	        }
	    },
	    eventRender: function(event, element) { 
	    	element.find('.fc-content, .fc-bg').css( 'cursor', 'pointer' );
	    	element.attr('data-toggle', 'modal');
	    	element.attr('data-target', '#bookSessionModal');
	    	element.find('.fc-time span').html(moment(event.start).format('HH:mm') + " - " + moment(event.end).format('HH:mm'));
        },
        selectable: true,
		selectHelper: true,
		select: function(start, end) {
			$('#bookSessionModal').modal('show');
			var eventData = {
				start: start,
				end: new Date(start + 3600000).getTime()
			};
			checkOverlap(eventData);
			$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
			$('#calendar').fullCalendar('unselect');
		},
        eventClick: function(calEvent, jsEvent, view) {			
			$(".title").html(calEvent.title);
			$(".description").html(calEvent.description);
			$(".date").html($.fullCalendar.formatDate(calEvent.start, 'dd/MM/yyyy HH:mm') + " - " + $.fullCalendar.formatDate(calEvent.end, 'HH:mm'));
			$(".price").html(calEvent.price);
			
			$("#addSessionBtn").click(function() {
				$.ajax({
			    		url : '<c:url value="/add_to_cart" />',
	 			    	contentType: 'application/json; charset=utf-8',
	 			    	type: 'POST',
	 			    	dataType: 'json',
	 			    	data: JSON.stringify({"id": calEvent.id, "type":"session", "quantity": 1}),
	 			    	complete: function (xhr, status) {
	 			    		if (status === 'error' || !xhr.responseText) {
	 			            	console.log("Failed add session to cart: " + status);
	 			        	}
	 			    		setTimeout(function(){
	 			    			window.location.href = '<c:url value="/cart" />';
	 			    		},700);
	 			    	}
 				});
			});
			
        }
		
	});
	
	
});



function checkOverlap(event) {  
    var start = new Date(event.start);
    var end = new Date(event.end);
    var overlap = $('#calendar').fullCalendar('clientEvents', function(ev) {
        if (ev == event)
        	return false;
        var estart = new Date(ev.start);
        var eend = new Date(ev.end);
        return (Math.round(estart)/1000 < Math.round(end)/1000 && Math.round(eend) > Math.round(start));
    });

    if (overlap.length){   
	    //either move this event to available timeslot or remove it
	    $('#calendar').fullCalendar('removeEvents', event._id);
    }                  
}

</script>



<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div id='calendar'></div>
		</div>
	</div>
	<!-- / .row -->
</div>
<!-- / .container -->



<!-- Modal -->
<div class="modal fade" id="bookSessionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-center">

		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Session Booking</h4>
			</div>
			<div class="modal-body">

				<div id="rootwizard">
					<table class="book-session-tbl">
						<tr>
							<td>
								<div class="navbar">
									<ul class="nav nav-pills nav-wizard">
										<li><a href="#tab1" data-toggle="tab">Choose Activity</a>
										<div class="nav-arrow"></div></li>
										<li><div class="nav-wedge"></div>
											<a href="#tab2" data-toggle="tab">Confirm</a></li>
									</ul>
								</div>
							</td>
						</tr>
						<tr class="book-session-tbl-tr-body">
							<td>
								<div class="tab-content">
									<div class="tab-pane" id="tab1">
										<div class="form-group">
											<label for="name">Activity</label> <select class="form-control">
												<option>Running</option>
												<option>Swimming</option>
												<option>Crossfit</option>
												<option>Yoga</option>
											</select>
										</div>
										<div class="form-group">
											<label for="name">Description</label>
											<p>Some session description. Some session description. Some session description. Some session
												description. Some session description.</p>
										</div>
									</div>
									<div class="tab-pane" id="tab2">
										<table class="table table-bordered confirm-booking-tbl">
											<thead>
												<tr>
													<th>Session</th>
													<th>Description</th>
													<th>Date</th>
													<th>*Price</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Running</td>
													<td>I'm booking session...</td>
													<td>30/09/2014 <span style="margin-left:10px"><i class="fa fa-clock-o"></i>11:00 - 12:00</span></td>
													<td>- 1 session</td>
												</tr>
											</tbody>
										</table>
										<span class="caveat">*Prices per session vary depending on what package you have purchased</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<ul class="pager wizard">
									<li class="previous"><a href="javascript:;">Previous</a></li>
									<li class="next"><a href="#" class="btn btn-color btn">Next</a></li>
									<li class="next finish" style="display: none;"><a href="#" class="btn btn-color btn">Book</a></li>
								</ul>
							</td>
						</tr>
					</table>
				</div><!-- End of rootwizard -->
			</div>
		</div>
	</div>
</div>


<!-- Booking Confirmation -->
<div class="modal-body booking-confirmation" style="display: hidden">
	<table class="book-session-tbl">
		<tr class="book-session-tbl-tr-body">
			<td>
				<table>
					<tr>
						<td>
							<div class="col-sm-12" style="text-align:center">
								<h3 style="padding-bottom:10px;">Congratulations!</h3>
								<h4>You've successfully booked your session.</h4>
							</div>
						</td>
					</tr>
					<tr>
						<td height="10px">
							<hr />
						</td>
					</tr>
					<tr>
						<td>
							<div class="col-sm-12" style="font-size:smaller">You can cancel the booking no earlier than 24h before your session time
								and your money/session will be returned to your credit account.
							</div>
						</td>
					</tr>
					<tr><td height="10px"></td></tr>
					<tr>
						<td>
							<div class="col-sm-12" style="font-size:smaller; padding-bottom:60px">Any cancellations earlier than 24h
								before your session time will result in your account being charged and money/session taken.
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" class="btn btn-color pull-right" data-dismiss="modal">Close</button>
			</td>
		</tr>
	</table>
</div>


<script>
	$(document).ready(
			function() {
				$('#rootwizard').bootstrapWizard(
						{
							onTabShow : function(tab, navigation, index) {
								var $total = navigation.find('li').length;
								var $current = index + 1;
								var $percent = ($current / $total) * 100;
								$('#rootwizard').find('.bar').css({
									width : $percent + '%'
								});

								// If it's the last tab then hide the last button and show the finish instead
								if ($current >= $total) {
									$('#rootwizard').find('.pager .next')
											.hide();
									$('#rootwizard').find('.pager .finish')
											.show();
									$('#rootwizard').find('.pager .finish')
											.removeClass('disabled');
								} else {
									$('#rootwizard').find('.pager .next')
											.show();
									$('#rootwizard').find('.pager .finish')
											.hide();
								}

							}
						});
				$('#rootwizard .finish').click(function() {
					/* 		alert('Finished!, Starting over!');
					 $('#rootwizard').find("a[href*='tab1']").trigger('click'); */
					bookSession();
				});
			});

	function bookSession() {
		$("#bookSessionModal .modal-body").replaceWith(
				$(".modal-body.booking-confirmation"));
		$(".modal-body.booking-confirmation").show();
	}
</script>


