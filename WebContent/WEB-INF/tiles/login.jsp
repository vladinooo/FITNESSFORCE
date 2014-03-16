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

<div id="loginForm" class="easyui-panel" title="Login"
	style="width: 350px">

	<div class="loginValidMsg">
		<c:if test="${'fail' eq param.auth}">
			<p>*Invalid Username or Password!</p>
		</c:if>
	</div>

	<div style="padding: 10px 0 10px 60px">
		<form
			action="${pageContext.request.contextPath}/j_spring_security_check"
			method="POST">
			<table>
				<tr>
					<td>Username:</td>
					<td><input class="easyui-validatebox" type="text"
						name="j_username"></input></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input class="easyui-validatebox" type="text"
						name="j_password"></input></td>
				</tr>
				<tr>
					<td colspan="2" align="right" style="padding: 10px 0;"><a
						href="javascript:void(0)" class="easyui-linkbutton"
						onclick="submitForm()">Login</a></td>
				</tr>
				<tr>
					<td colspan="2">
						<p><a href="<c:url value="/create_user"/>">Create New User</a></p>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<script>
	function submitForm() {
		$('#loginForm form').submit();
	}
</script>