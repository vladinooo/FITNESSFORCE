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


<div class="container-fluid">
	<div id="login">
		<div class="login-wrapper" data-active="log">
			<a class="navbar-brand" href="dashboard.html"><img
				src="${pageContext.request.contextPath}/static/bootstrap/genyx/images/logodark.png"
				alt="Genyx admin" class="img-responsive"></a>
			<div id="log">
				<div class="page-header">
					<h3 class="center">Please login</h3>
				</div>
				<form role="form" id="login-form" class="form-horizontal"
					action="${pageContext.request.contextPath}/j_spring_security_check"
					method="POST">

					<c:if test="${'fail' eq param.auth}">
						<p class="loginValidationError">Invalid Username or Password!</p>
					</c:if>

					<div class="row">
						<div class="form-group relative">
							<div class="icon">
								<i class="icon20 i-user"></i>
							</div>
							<input class="form-control" type="text" name="j_username"
								id="user" placeholder="Username" value="">

						</div>
						<!-- End .control-group  -->
						<div class="form-group relative">
							<div class="icon">
								<i class="icon20 i-key"></i>
							</div>
							<input class="form-control" type="password" name="j_password"
								id="password" placeholder="Password" value="">

						</div>
						<!-- End .control-group  -->
						<div class="form-group relative">
							<label class="control-label" class="checkbox pull-left">
								<input type="checkbox" value="1" name="remember">
								Remember me ?
							</label>
							<button id="loginBtn" type="submit"
								class="btn btn-primary pull-right col-lg-5">Login</button>
						</div>
					</div>
					<!-- End .row-fluid  -->
				</form>
				<p class="center">
					Don't have an account? <a href="<c:url value="/create_user"/>"
						id="register"><strong>Create one now</strong></a>
				</p>
			</div>
			<div id="reg">
				<div class="page-header">
					<h3 class="center">Register account</h3>
				</div>

			</div>
		</div>
		<div id="bar" data-active="log">
			<div class="btn-group btn-group-vertical">
				<a id="log" href="<c:url value="/login"/>" class="btn tipR"
					title="Login"><i class="icon16 i-key"></i></a> <a id="reg"
					href="<c:url value="/create_user"/>" class="btn tipR"
					title="Register account"><i class="icon16 i-user-plus"></i></a>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>