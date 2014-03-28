<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
	$(document).ready(function() {
		$('[name="j_username"]').focus();
	});

	// submit form on pressing Enter key
	document.onkeypress = stopRKey;
	function stopRKey(evt) {
		var evt = (evt) ? evt : ((event) ? event : null);
		var node = (evt.target) ? evt.target
				: ((evt.srcElement) ? evt.srcElement : null);
		if (evt.keyCode == 13) {
			//submit form
			document.forms[0].submit();
		}
	}
</script>

<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
	<div class="sign-form">
		<h3 class="first-child">Log In To Your Account</h3>
		<hr>
		<form role="form" id="login-form"
			action="${pageContext.request.contextPath}/j_spring_security_check"
			method="POST">

			<c:if test="${'fail' eq param.auth}">
				<p class="fieldValidationError">Invalid Username or Password!</p>
			</c:if>

			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user"></i></span> <input
					class="form-control" type="text" name="j_username" id="user"
					placeholder="Username" value="">
			</div>

			<br>

			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-lock"></i></span> <input
					class="form-control" type="password" name="j_password"
					id="password" placeholder="Password" value="">
			</div>

			<div class="checkbox">
				<label> <input type="checkbox"> Remember me
				</label>
			</div>

			<button type="submit" class="btn btn-color">Submit</button>


			<hr>
		</form>

		<p>
			Don't have an account? <a href="<c:url value="/create_user"/>">Create
				one now</a>
		</p>
	</div>
</div>




