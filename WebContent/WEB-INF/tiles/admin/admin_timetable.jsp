<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script>

$(document).ready(function() {
	
	
	/* initialize the external events
	-----------------------------------------------------------------*/

	$('#external-events div.external-event').each(function() {
	
		// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
		// it doesn't need to have a start or end
		var eventObject = {
			title: $.trim($(this).text()) // use the element's text as the event title
		};
		
		// store the Event Object in the DOM element so we can get to it later
		$(this).data('eventObject', eventObject);
		
		// make the event draggable using jQuery UI
		$(this).draggable({
			zIndex: 999,
			revert: true,      // will cause the event to go back to its
			revertDuration: 0  //  original position after the drag
		});
		
	});


	/* initialize the calendar
	-----------------------------------------------------------------*/
	
	$('#admin_timetable').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		allDayDefault: false,
		defaultView: 'agendaWeek',
		editable: true,
		defaultEventMinutes: 30,
		startEditable: true,
		durationEditable: true,
		droppable: true, // this allows things to be dropped onto the calendar !!!
		drop: function(date, allDay, ui) { // this function is called when something is dropped
		
			// retrieve the dropped element's stored Event Object
			var originalEventObject = $(this).data('eventObject');
			
			// we need to copy it, so that multiple events don't have a reference to the same object
			var copiedEventObject = $.extend({}, originalEventObject);
			
			// assign it the date that was reported
			copiedEventObject.start = date;
			copiedEventObject.end = new Date(date.getTime() + 3600000);
			copiedEventObject.allDay = allDay;
			
			// render the event on the calendar
			// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
			$('#admin_timetable').fullCalendar('renderEvent', copiedEventObject, true);

           	// JQuery UI Modal Dialog	
           	$('#createSessionModal').dialog({
           		autoOpen: true,
           		modal: true,
           		dialogClass: 'dialog',
           		buttons: [
           		          {
           		              text: "Save",
           		              "class": "btn btn-primary",
           		              click: function() {
           		            	  	$.ajax({
           		 			    		url : '<c:url value="/create_session" />',
	           		 			    	contentType: 'application/json; charset=utf-8',
	           		 			    	type: 'POST',
	           		 			    	dataType: 'json',
	           		 			    	data: JSON.stringify({"title": "Session", "start": date.getTime(), "end": new Date(date.getTime() + 3600000).getTime()}),
	           		 			    	async : false,
	           		 			    	complete: function (xhr, status) {
	           		 			    		if (status === 'error' || !xhr.responseText) {
	           		 			            	console.log("Failed to create session: " + status);
	           		 			        	}
	           		 			    	}
	           		 				});
           		            		$(this).dialog("close");
           		              }
           		          },
           		          {
           		        	  text: "Cancel",
           		              click: function() {
           		            	  var clientEvents = $('#admin_timetable').fullCalendar('clientEvents');
           		            	  var lastEvent = clientEvents[clientEvents.length-1];
           		            	  $('#admin_timetable').fullCalendar('removeEvents', lastEvent._id);
           		            	  $(this).dialog("close");
           		              }
           		          }
           		      ]
           	});
        
            $("div.dialog button").addClass("btn");
	            
						
		},
		eventClick: function(calEvent, jsEvent, view) {
			

	    },
		eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {
							

					
	    },
	    eventResize: function(event,dayDelta,minuteDelta,revertFunc) {

	        alert(
	            "The end date of " + event.title + "has been moved " +
	            dayDelta + " days and " +
	            minuteDelta + " minutes."
	        );

	        if (!confirm("is this okay?")) {
	            revertFunc();
	        }

	    },
	    events: {
	        url: '<c:url value="/get_sessions" />',
	        type: 'POST',
	        error: function() {
	            alert('there was an error while fetching events!');
	        }
	    },
	    timeFormat: 'H:mm{ - h:mm }',
	    eventRender: function(event, element) { 
            element.find('.fc-event-inner').addClass('sessionModalDialog'); 
            element.find('.fc-event-inner').css('text-align', 'center'); 
            element.find('.fc-event-time').append("<br/>"); 
            
            
            $(".sessionModalDialog").each(function(i){
            	$(this).click(function(){
            		$('#sessionModal').dialog('open');
            		return false;
            	});
            	
            	// JQuery UI Modal Dialog	
            	$('#sessionModal').dialog({
            		autoOpen: false,
            		modal: true,
            		dialogClass: 'dialog',
            		buttons: [
            		          {
            		              text: "Delete",
            		              "class": "btn btn-danger",
            		              click: function() {
            		            	  var url = $("#deleteUserUrl" + i).text();
            		            	  window.location = url;
            		            	  $(this).dialog("close");
            		              }
            		          },
            		          {
            		        	  text: "Cancel",
            		              click: function() {
            		            	  $(this).dialog("close");
            		              }
            		          }
            		      ]
            	});
            	
            });


            $("div.dialog button").addClass("btn");
            
        } 
	    
	});
	
});

</script>


<div id="heading" class="page-header">
	<h1>
		<i class="icon20 i-calendar"></i> Timetable
	</h1>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="icon">
					<i class="icon20 i-calendar"></i>
				</div>
				<h4>View timetable</h4>
				<a href="#" class="minimize"></a>
			</div>
			<!-- End .panel-heading -->

			<div class="panel-body">
				<div class="col-lg-8">
					<div id='admin_timetable'></div>
				</div>
				<div class="col-lg-4">
					<div class="panel panel-default">
                       <div class="panel-heading">
                           <div class="icon"><i class="icon20 i-man"></i></div> 
                           <h4>Session</h4>
                           <a href="#" class="minimize"></a>
                       </div><!-- End .panel-heading -->
                   
                       <div class="panel-body center">
	                       <div id="external-events">
	                            <div class="external-event">Session</div>
	                            <p>Drag and drop the session to calendar</p>
	                       </div>
                       </div><!-- End .panel-body -->
                   </div><!-- End .widget -->
				</div>
			</div><!-- End .panel-body -->
			
			<div title="Create Session" id="createSessionModal" class="modalDialog">
				<div class="panel-body">
	                <form class="form-horizontal" id="create-session-form" role="form">
	             
	                    <div class="form-group">
	                        <label class="col-lg-2 control-label" for="required">Title</label>
	                        <div class="col-lg-4">
	                            <input class="form-control" type="text" name="title" />
	                        </div>
	                    </div><!-- End .control-group  -->
              
	                </form>
	            </div><!-- End .panel-body -->  
			</div><!-- End modal -->  
			
			<div title="EDIT SESSION" id="sessionModal" class="modalDialog">
			
				 <p>sdfsfd</p>
			    
			</div>
		</div>
		<!-- End .widget -->
	</div>
	<!-- End .col-lg-12  -->
</div>
<!-- End .row-fluid  -->

