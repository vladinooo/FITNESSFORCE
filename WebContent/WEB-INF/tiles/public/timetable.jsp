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
        },
        eventClick: function(calEvent, jsEvent, view) {
        	$("#addSessionModal").removeClass("hidden");
        	$("#addSessionModal").dialog({
				width: 500, // overcomes width:'auto' and maxWidth bug
			    maxWidth: 600,
			    height: 'auto',
			    modal: true,
			    fluid: true, //new option
			    resizable: false,
			    autoOpen: false,
			    dialogClass: 'dialog'
			});
			
			$("div.dialog button").addClass("btn");
			$("#add-session-form input[name=title]").attr('maxlength','18');
			$("#add-session-form textarea[name=description]").attr('maxlength','100');
			$("#add-session-form input[name=price]").attr('maxlength','6');

			$("#add-session-form input[name=title]").val(calEvent.title);
			$("#add-session-form textarea[name=description]").val(calEvent.description);
			$("#add-session-form input[name=price]").val(calEvent.price);
			
		

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
		
		<!-- Button trigger modal -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>

	</div>
	<!-- / .row -->
</div>
<!-- / .container -->



<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>





