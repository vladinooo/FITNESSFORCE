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
	    	element.css('background-color', "'" + event.color + "'");
            element.find('.fc-event-inner').css({"text-align":"center", "-webkit-font-smoothing": "antialiased"}); 
            element.find('.fc-event-time').css('font-weight', 'bold');
            element.find('.fc-event-time').append("<br/>"); 
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


