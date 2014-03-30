<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div id="heading" class="page-header">
    <h1><i class="icon20 i-users"></i> Users</h1>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="icon"><i class="icon20 i-user-plus"></i></div> 
                <h4>Add new</h4>
                <a href="#" class="minimize"></a>
            </div><!-- End .panel-heading -->
        
            <div class="panel-body">

                <form:form class="form-horizontal" id="admin-create-user-form"
					action="${pageContext.request.contextPath}/do_admin_create_user"
					commandName="user" method="POST" role="form">
             
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="required">Username</label>
                        <div class="col-lg-10">
                            <form:input class="required form-control" type="text" name="username"
								id="user" path="username" minlength="4"/>
							<form:errors path="username" cssClass="fieldValidationError"></form:errors>
							<c:if test="${duplicateUser != null}">
								<p class="fieldValidationError">Username already exists!</p>
							</c:if>
						</div>
                    </div><!-- End .control-group  -->
                    
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="required">Password</label>
                        <div class="col-lg-10">
                            <form:input id="password" class="form-control" type="password" name="password"
								path="password" />
							<form:errors path="password" cssClass="fieldValidationError"></form:errors>
                        </div>
                    </div><!-- End .control-group  -->
                    
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="range">Re-type password</label>
                        <div class="col-lg-10">
							<input id="confirm_password" name="confirm_password" type="password" class="form-control" />
                        </div>
                    </div><!-- End .control-group  -->
                    
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="required">Required email</label>
                        <div class="col-lg-10">
                            <form:input class="required email form-control" type="text" name="email"
								id="email-field"  path="email" />
							<form:errors path="email" cssClass="fieldValidationError"></form:errors>
                        </div>
                    </div><!-- End .control-group  -->
                    
                    <div class="form-group">
                        <div class="col-lg-offset-2">
                            <div class="pad-left15">
                                <button type="submit" class="btn btn-primary">Save</button>
                                <a href="<c:url value='users'/>">
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

