<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div id="heading" class="page-header">
    <h1><i class="icon20 i-people"></i> Sessions</h1>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="icon"><i class="icon20 i-man"></i></div> 
                <h4>Add new</h4>
                <a href="#" class="minimize"></a>
            </div><!-- End .panel-heading -->
        
            <div class="panel-body">

                <form:form class="form-horizontal" id="create-session-form"
					action="${pageContext.request.contextPath}/do_create_session"
					commandName="session" method="POST" role="form">
             
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="required">Title</label>
                        <div class="col-lg-3">
                            <form:input class="form-control" type="text" name="title"
								path="title" />
							<form:errors path="title" cssClass="fieldValidationError"></form:errors>
                        </div>
                    </div><!-- End .control-group  -->
					
					<div class="form-group">
						<label class="col-lg-2 control-label" for="elastic">Description</label>
						<div class="col-lg-6">
							<form:textarea name="description" class="form-control" path="description" rows="2" />
							<form:errors path="description" cssClass="fieldValidationError"></form:errors>
						</div>
					</div>
					
					<div class="form-group">
                        <label class="col-lg-2 control-label" for="datepicker">Session start</label>
                        <div class="col-lg-3">
                            <div id="sessionStartDp" class="input-group date" data-date-format="dd-mm-yyyy">
                                <input size="16" class="form-control" type="text">
                                <span class="input-group-addon"><i class="icon16 i-calendar-4"></i></span>
                            </div>
                        </div>
                        <div class="col-lg-3">
                        	<div class="input-group">
                                <input class="form-control" type="text" id="sessionStartTp" />
                                <span class="input-group-addon"><i class="icon16 i-clock"></i></span>
                            </div>
                       	</div>
                    </div>
                    
                 	<div class="form-group">
                        <label class="col-lg-2 control-label" for="datepicker">Session end</label>
                        <div class="col-lg-3">
                            <div id="sessionEndDp" class="input-group date" data-date-format="dd-mm-yyyy">
                                <input size="16" class="form-control" type="text">
                                <span class="input-group-addon"><i class="icon16 i-calendar-4"></i></span>
                            </div>
                        </div>
                        <div class="col-lg-3">
                        	<div class="input-group">
                                <input class="form-control" type="text" id="sessionEndTp" />
                                <span class="input-group-addon"><i class="icon16 i-clock"></i></span>
                            </div>
                       	</div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="required">Price</label>
                        <div class="col-lg-3">
                            <form:input class="form-control" type="text" name="price"
								path="title" />
							<form:errors path="price" cssClass="fieldValidationError"></form:errors>
                        </div>
                    </div><!-- End .control-group  -->

					<div class="form-group">
                        <div class="col-lg-offset-2">
                            <div class="pad-left15">
                                <button type="submit" class="btn btn-primary">Save</button>
                                <a href="<c:url value='sessions'/>">
									<button type="button" class="btn">Cancel</button>
								</a>
                            </div>
                        </div>
                    </div><!-- End .form-group  -->
                    
                </form:form>
            </div><!-- End .panel-body -->            
        </div><!-- End .widget -->
    </div><!-- End .col-lg-12  --> 
</div><!-- End .row-fluid  -->
