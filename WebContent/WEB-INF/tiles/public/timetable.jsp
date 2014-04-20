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
	    	element.attr('data-toggle', 'modal');
	    	element.attr('data-target', '#myModal');
	    	element.css('background-color', "'" + event.color + "'");
            element.find('.fc-event-inner').css({"text-align":"center", "-webkit-font-smoothing": "antialiased"}); 
            element.find('.fc-event-time').css('font-weight', 'bold');
            element.find('.fc-event-time').append("<br/>"); 
        },
        eventClick: function(calEvent, jsEvent, view) {
			$(".sessionTitle").html(calEvent.title);
			$(".sessionDescription").html(calEvent.description);
			$(".sessionDate").html($.fullCalendar.formatDate(calEvent.start, 'dd/MM/yyyy HH:mm') + " - " + $.fullCalendar.formatDate(calEvent.end, 'HH:mm'));
			$(".sessionPrice").html(calEvent.price);
			
			$('#cancelSessionBtn').click(function(e) {
           	 	e.preventDefault();
           	  	$("#addSessionModal").dialog("close");
			});
			
			
			$("#addSessionModal").dialog('open');
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-center">
	
	<form:form method="POST">
	
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Session</h4>
				</div>
				<div class="modal-body">

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4><span class="sessionTitle"></span></h4>
						</div>
						<div class="panel-body">
							<p><span class="sessionDescription"></span></p>
							
							<hr />

							<span class="pull-left" style="font-size: medium;">Date: <span class="sessionDate "></span></span>
							
							<h4>
								<span class="pull-right">Price: £<span class="sessionPrice"></span></span>
							</h4>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		
		</form:form>
		
	</div>
</div>





