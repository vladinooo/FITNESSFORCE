<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

 
<script>

$(document).ready(function() {
	
	// on window resize run function
	$(window).resize(function () {
	    fluidDialog();
	});

	// catch dialog if opened within a viewport smaller than the dialog width
	$(document).on("dialogopen", ".ui-dialog", function (event, ui) {
	    fluidDialog();
	});

	function fluidDialog() {
	    var $visible = $(".ui-dialog:visible");
	    // each open dialog
	    $visible.each(function () {
	        var $this = $(this);
	        var dialog = $this.find(".ui-dialog-content").data("ui-dialog");
	        // if fluid option == true
	        if (dialog.options.fluid) {
	            var wWidth = $(window).width();
	            // check window width against dialog width
	            if (wWidth < (parseInt(dialog.options.maxWidth) + 50))  {
	                // keep dialog from filling entire screen
	                $this.css("max-width", "90%");
	            } else {
	                // fix maxWidth bug
	                $this.css("max-width", dialog.options.maxWidth + "px");
	            }
	            //reposition dialog
	            dialog.option("position", dialog.options.position);
	        }
	    });

	}
	
	
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
		defaultEventMinutes: 60,
		axisFormat: 'HH:mm',
		minTime: 8,
		maxTime: 23,
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

            $.ajax({
			    	url : '<c:url value="/create_session" />',
 			    	contentType: 'application/json; charset=utf-8',
 			    	type: 'POST',
 			    	dataType: 'json',
 			    	data: JSON.stringify({
 			    		"title": "Session name",
 			    		"description": "Session description...",
 			    		"price": 0,
 			    		"color": "#3a87ad",
 			    		"start": date.getTime(),
 			    		"end": new Date(date.getTime() + 3600000).getTime()}),
 			    	complete: function (xhr, status) {
 			    		if (status === 'error' || !xhr.responseText) {
 			            	console.log("Failed to create session: " + status);
 			        	}
 			    		window.location.href = '<c:url value="/admin_timetable" />';
 			    	}
 			});		
		},
		eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {
	    	$.ajax({
	    		url : '<c:url value="/edit_session" />',
		    	contentType: 'application/json; charset=utf-8',
		    	type: 'POST',
		    	dataType: 'json',
		    	data: JSON.stringify({
		    		"id": event.id,
		    		"title": event.title,
		    		"description": event.description,
		    		"price": event.price,
		    		"color": event.color,
		    		"start": event.start.getTime(),
		    		"end": event.end.getTime()}),
		    	complete: function (xhr, status) {
		    		if (status === 'error' || !xhr.responseText) {
		            	console.log("Failed to edit session: " + status);
		        	}
		    		window.location.href = '<c:url value="/admin_timetable" />';
		    	}
			});
	    },
	    eventResize: function(event,dayDelta,minuteDelta,revertFunc) {
	    	$.ajax({
		    		url : '<c:url value="/edit_session" />',
			    	contentType: 'application/json; charset=utf-8',
			    	type: 'POST',
			    	dataType: 'json',
			    	data: JSON.stringify({
			    		"id": event.id,
			    		"title": event.title,
			    		"description": event.description,
			    		"price": event.price,
			    		"color": event.color,
			    		"start": event.start.getTime(),
			    		"end": event.end.getTime()}),
			    	complete: function (xhr, status) {
			    		if (status === 'error' || !xhr.responseText) {
			            	console.log("Failed to edit session: " + status);
			        	}
			    		window.location.href = '<c:url value="/admin_timetable" />';
			    	}
				});
	    },
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
            element.find('.fc-event-inner').css('text-align', 'center'); 
            element.find('.fc-event-time').css('font-weight', 'bold');
            element.find('.fc-event-time').append("<br/>"); 
        },
        eventClick: function(calEvent, jsEvent, view) {
        	$("#editSessionModal").removeClass("hidden");
        	$("#editSessionModal").dialog({
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
			$("#edit-session-form input[name=title]").attr('maxlength','18');
			$("#edit-session-form textarea[name=description]").attr('maxlength','100');
			$("#edit-session-form input[name=price]").attr('maxlength','6');

			$("#edit-session-form input[name=title]").val(calEvent.title);
			$("#edit-session-form textarea[name=description]").val(calEvent.description);
			$("#edit-session-form input[name=price]").val(calEvent.price);
			
			$("#colorPicker").spectrum({
				showPaletteOnly: true,
			    showPalette:true,
			    palette: [
			        ['#262626', '#494429', '#17365D', '#366092', '#3a87ad',
			        '#76923C', '#B2A2C7', '#5F497A', '#953734', '#E36C09']
			    ]
			}).spectrum("set", calEvent.color);  
			
			$("#edit-session-form").validate({
		 		rules: {
		 			title: {required: true, minlength: 5, maxlength: 18},
					price: {number: true}
		 		},
		 		messages: {
		 			title: "Please enter a title between 5-18 characters."
		 		},
		        submitHandler: function(form) {
		        	var color = $("#colorPicker").spectrum('get').toHexString();
		            $.ajax({
	 			    		url : '<c:url value="/edit_session" />',
		 			    	contentType: 'application/json; charset=utf-8',
		 			    	type: 'POST',
		 			    	dataType: 'json',
		 			    	data: JSON.stringify({
		 			    		"id": calEvent.id,
		 			    		"title": form.title.value,
		 			    		"description": form.description.value,
		 			    		"price": form.price.value,
		 			    		"color": color,
		 			    		"start": calEvent.start.getTime(),
		 			    		"end": calEvent.end.getTime()}),
		 			    	complete: function (xhr, status) {
		 			    		if (status === 'error' || !xhr.responseText) {
		 			            	console.log("Failed to edit session: " + status);
		 			        	}
		 			    		window.location.href = '<c:url value="/admin_timetable" />';
		 			    	}
		 				});
		            $("#editSessionModal").dialog("close");
		            return false;
		        }
		    });

			$('#cancelSessionBtn').click(function(e) {
           	 	e.preventDefault();
           	  	$("#editSessionModal").dialog("close");
			});
			
			$('#deleteSessionBtn').click(function() {
				$.ajax({
			    		url : '<c:url value="/delete_session" />',
	 			    	contentType: 'application/json; charset=utf-8',
	 			    	type: 'POST',
	 			    	dataType: 'json',
	 			    	data: JSON.stringify({"id": calEvent.id}),
	 			    	complete: function (xhr, status) {
	 			    		if (status === 'error' || !xhr.responseText) {
	 			            	console.log("Failed to edit session: " + status);
	 			        	}
	 			    		window.location.href = '<c:url value="/admin_timetable" />';
	 			    	}
	 				});
           	  	$("#editSessionModal").dialog("close");
			});
			
			$("#editSessionModal").dialog('open');
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
			
			
			<div title="Edit Session" id="editSessionModal" class="modalDialog hidden">
				<div class="panel-body">
	
	                <form class="form-horizontal" id="edit-session-form">
	             
	                    <div class="form-group">
	                        <label class="col-lg-3 control-label" for="required">Title</label>
	                        <div class="col-lg-8">
	                            <input class="form-control" type="text" name="title" />
	                        </div>
	                    </div><!-- End .control-group  -->
	                    
	                    <div class="form-group">
						<label class="col-lg-3 control-label" for="elastic">Description</label>
							<div class="col-lg-8">
								<textarea name="description" class="form-control" rows="2"></textarea>
							</div>
						</div>

						<div class="form-group">
							<label class="col-lg-3 control-label" for="required">Price</label>
							<div class="col-lg-8">
								<input class="form-control" type="text" name="price" />
							</div>
						</div><!-- End .control-group  -->
						
						<div class="form-group">
							<label class="col-lg-3 control-label" for="required">Color</label>
							<div class="col-lg-8">
								<input id="colorPicker" class="form-control" type="text" name="color" />
							</div>
						</div><!-- End .control-group  -->

						<br /><br />
						
						<div class="form-group">
							<label class="col-lg-3 control-label" for="required"></label>
							<div class="col-lg-8">
								<button id="deleteSessionBtn" class="btn-danger">Delete</button>
								<div class="pull-right">
									<button type="submit" class="btn btn-primary">Save</button>
									<button id="cancelSessionBtn" class="btn-default">Cancel</button>
								</div>
							</div>
					
					</div><!-- End .form-group  -->

	                    
	                </form>
	            </div><!-- End .panel-body -->  
            
            </div>
            
		
		</div>
		<!-- End .widget -->
	</div>
	<!-- End .col-lg-12  -->
</div>
<!-- End .row-fluid  -->


<%-- buttons: [
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
	           		        	"class": "btn",
	           		              click: function() {
	           		            	  var clientEvents = $('#admin_timetable').fullCalendar('clientEvents');
	           		            	  var lastEvent = clientEvents[clientEvents.length-1];
	           		            	  $('#admin_timetable').fullCalendar('removeEvents', lastEvent._id);
	           		            	  $(this).dialog("close");
	           		              }
	           		          }
	           		      ] 
	           		      
	           		      
	           		      
	           		          				var clientEvents = $('#admin_timetable').fullCalendar('clientEvents');
               	  	var lastEvent = clientEvents[clientEvents.length-1];
               	  	$('#admin_timetable').fullCalendar('removeEvents', lastEvent._id);
	           		      
	           		      --%>

