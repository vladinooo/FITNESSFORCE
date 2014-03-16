
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>
	$(document).ready(function() {
		$('[name="j_username"]').focus();
	});
</script>


<div id="loginForm" class="easyui-panel" title="Login"
	style="width: 400px">
	<div style="padding: 10px 0 10px 60px">
		<form
			action="${pageContext.request.contextPath}/j_spring_security_check"
			method="POST">
			<table>
				<tr>
					<td>Username:</td>
					<td><input class="easyui-validatebox" type="text"
						name="j_username"></input></td>
					<td><form:errors path="username" cssClass="fieldValError"></form:errors></td>
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
			</table>
		</form>
	</div>
</div>
<script>
	function submitForm() {
		$('#loginForm form').submit();
	}
</script>