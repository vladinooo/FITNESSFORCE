<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
	function onLoad() {
		$("#password").keyup(checkPasswordsMatch);
		$("#password2").keyup(checkPasswordsMatch);
		$("#create-user-form").submit(canSubmit);
	}

	function canSubmit() {
		var password = $("#password").val();
		var password2 = $("#password2").val();

		if (password != password2) {
			$(".passwdMatchError").text("Passwords don't match!");
			return false;
		} else {
			return true;
		}
	}

	function checkPasswordsMatch() {
		var password = $("#password").val();
		var password2 = $("#password2").val();

		if (password.length > 0 || password2.length > 0) {

			if (password != password2) {
				$(".passwdMatchError").text("Passwords don't match!");
			} else {
				$(".passwdMatchError").text("");
			}
		}
	}

	$(document).ready(onLoad);
</script>


<div class="container-fluid">
	<div id="login">
		<div class="login-wrapper" data-active="reg">
			<a class="navbar-brand" href="dashboard.html"><img
				src="${pageContext.request.contextPath}/static/bootstrap/genyx/images/logodark.png"
				alt="Genyx admin" class="img-responsive"></a>

			<div id="log">
				<div class="page-header">
					<h3 class="center">Please login</h3>
				</div>
			</div>

			<div id="reg">
				<div class="page-header">
					<h3 class="center">Create account</h3>
				</div>
				<form:form class="form-horizontal" id="create-user-form"
					action="${pageContext.request.contextPath}/do_create_user"
					commandName="user" method="POST">

					<c:if test="${duplicateUser != null}">
						<p class="loginValidationError">Username already exists!</p>
					</c:if>

					<div class="row">
						<div class="form-group relative">
							<div class="icon">
								<i class="icon20 i-user"></i>
							</div>
							<form:input class="form-control" type="text" name="username"
								id="user" placeholder="Username" path="username" />
							<form:errors path="username" cssClass="loginValidationError"></form:errors>
						</div>
						<!-- End .control-group  -->
						<div class="form-group relative">
							<div class="icon">
								<i class="icon20 i-key"></i>
							</div>
							<form:input class="form-control" type="password" name="password"
								id="password" placeholder="Password" path="password" />
							<form:errors path="password" cssClass="loginValidationError"></form:errors>
						</div>
						<!-- End .control-group  -->
						<div class="form-group relative">
							<div class="icon">
								<i class="icon20 i-key"></i>
							</div>
							<input class="form-control" type="password" name="password2"
								id="password2" placeholder="Re-type password"> <span
								class="passwdMatchError"></span>
						</div>
						<!-- End .control-group  -->
						<div class="form-group relative">
							<div class="icon">
								<i class="icon20 i-envelop-2"></i>
							</div>
							<form:input class="form-control" type="text" name="email"
								id="email-field" placeholder="Your email" path="email" />
							<form:errors path="email" cssClass="loginValidationError"></form:errors>
						</div>
						<!-- End .control-group  -->
						<div class="form-group">
							<button type="submit" id="createUserBtn" class="btn btn-lg btn-block btn-danger">Create
								my account</button>
						</div>
					</div>
					<!-- End .row-fluid  -->
				</form:form>
			</div>
		</div>
		<div id="bar" data-active="reg">
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
