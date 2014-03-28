<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
	<div class="sign-form">
		<h3 class="first-child">Create New Account</h3>
		<hr>

		<form:form class="form-horizontal" id="create-user-form"
			action="${pageContext.request.contextPath}/do_create_user"
			commandName="user" method="POST" role="form">

			<div class="form-group">
				<form:input class="form-control" type="text" name="email" id="email"
					placeholder="Your email" path="email" data-toggle="popover"
					data-placement="left" data-trigger="focus"
					data-content="Enter a valid email here."
					data-original-title="Email" />
				<form:errors path="email" cssClass="fieldValidationError"></form:errors>
			</div>

			<div class="form-group">
				<form:input class="form-control" type="text" name="username"
					id="username" placeholder="Username" path="username"
					data-toggle="popover" data-placement="left" data-trigger="focus"
					data-content="Enter your full name here."
					data-original-title="Username" minlength="5"/>
				<form:errors path="username" cssClass="fieldValidationError"></form:errors>
				<c:if test="${duplicateUser != null}">
					<p class="fieldValidationError">Username already exists!</p>
				</c:if>

			</div>

			<div class="form-group">
				<form:input class="form-control margin-bottom-xs" type="password"
					name="password" id="password" placeholder="Password"
					path="password" data-toggle="popover" data-placement="left"
					data-trigger="focus" data-content="Between 5 - 10 characters"
					data-original-title="Password" />
				<form:errors path="password" cssClass="fieldValidationError"></form:errors>
			</div>

			<div class="form-group">
				<input class="form-control" type="password" id="confirm_password"
					name="confirm_password" placeholder="Re-type password"
					data-toggle="popover" data-placement="left" data-trigger="focus"
					data-content="Between 5 - 10 characters"
					data-original-title="Re-type password">
			</div>

			<div class="form-group">
				<button type="submit" id="createUserBtn" class="btn btn-color">Create
					account</button>
			</div>
		</form:form>
	</div>
</div>
