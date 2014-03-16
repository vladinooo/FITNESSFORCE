<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="newUserForm" class="easyui-panel" title="Create New User"
	style="width: 350px">

	<form:form method="post"
		action="${pageContext.request.contextPath}/do_create_user"
		commandName="user">

		<div class="loginValidMsg">
			<p><form:errors path="username" cssClass="fieldValError"></form:errors></p>
			<p><form:errors path="password" cssClass="fieldValError"></form:errors></p>
			<p><form:errors path="email" cssClass="fieldValError"></form:errors></p>
		</div>

		<div style="padding: 10px 0 10px 60px">

			<table>
				<tr>
					<td class="label">Username:</td>
					<td><form:input class="control" path="username"
							name="username" type="text" /></td>
				</tr>
				<tr>
					<td class="label">Password:</td>
					<td><form:input class="control" path="password"
							name="password" type="text" /></td>
				</tr>
				<tr>
					<td class="label">Email:</td>
					<td><form:input class="control" path="email" name="email"></form:input></td>
				</tr>
				<tr>
					<td colspan="2" align="right" style="padding: 10px 0;"><a
						href="javascript:void(0)" class="easyui-linkbutton"
						onclick="submitForm()">Create</a></td>
				</tr>
				<tr>
					<td colspan="2">
						<p>
							<a href="<c:url value="/login"/>">Login</a>
						</p>
					</td>
				</tr>
			</table>

		</div>

	</form:form>

</div>

<script>
	function submitForm() {
		$('#newUserForm form').submit();
	}
</script>
