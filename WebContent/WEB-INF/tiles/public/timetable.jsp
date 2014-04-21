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
		allDayDefault: false,
		defaultView: 'agendaWeek',
		defaultEventMinutes: 60,
		axisFormat: 'HH:mm',
		minTime: 8,
		maxTime: 23,
	    events: {
	        url: '<c:url value="/get_sessions" />',
	        type: 'POST',
	        error: function() {
	            alert('there was an error while fetching events!');
	        }
	    },
	    timeFormat: 'H:mm{ - H:mm }',
	    eventRender: function(event, element) { 
	    	element.find('.fc-event-inner').css( 'cursor', 'pointer' );
	    	element.attr('data-toggle', 'modal');
	    	element.attr('data-target', '#addSessionModal');
	    	element.css('background-color', "'" + event.color + "'");
            element.find('.fc-event-inner').css({"text-align":"center", "-webkit-font-smoothing": "antialiased"}); 
            element.find('.fc-event-time').css('font-weight', 'bold');
            element.find('.fc-event-time').append("<br/>"); 
        },
        eventClick: function(calEvent, jsEvent, view) {			
			$(".title").html(calEvent.title);
			$(".description").html(calEvent.description);
			$(".date").html($.fullCalendar.formatDate(calEvent.start, 'dd/MM/yyyy HH:mm') + " - " + $.fullCalendar.formatDate(calEvent.end, 'HH:mm'));
			$(".price").html(calEvent.price);
			
			$("#addSessionBtn").click(function() {
				$.ajax({
			    		url : '<c:url value="/add_session_to_cart" />',
	 			    	contentType: 'application/json; charset=utf-8',
	 			    	type: 'POST',
	 			    	dataType: 'json',
	 			    	data: JSON.stringify({"id": calEvent.id}),
	 			    	complete: function (xhr, status) {
	 			    		if (status === 'error' || !xhr.responseText) {
	 			            	console.log("Failed add session to cart: " + status);
	 			        	}
	 			    		setTimeout(function(){
	 			    			window.location.href = '<c:url value="/cart" />';
	 			    		},1000);
	 			    	}
 				});
			});
			
        }
		
	});
	
	
});

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
<div class="modal fade" id="addSessionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-center">
		
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Session</h4>
				</div>
				<div class="modal-body">

					<div class="panel panel-default">
						<div class="panel-heading">
							<input type="hidden" name="title" />
							<h4><span class="title"></span></h4>
						</div>
						<div class="panel-body">
							<input type="hidden" name="description" />
							<p><span class="description"></span></p>
							
							<hr />

							<input type="hidden" name="date" />
							<span class="pull-left" style="font-size: medium;">Date: <span class="date"></span></span>
							
							<input type="hidden" name="price" />
							<h4><span class="pull-right">Price: £<span class="price"></span></span></h4>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" id="addSessionBtn" data-dismiss="modal">Add</button>
				</div>
			</div>
	</div>
</div>





