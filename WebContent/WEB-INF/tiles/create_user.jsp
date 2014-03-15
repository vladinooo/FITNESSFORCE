
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form method="post" action="${pageContext.request.contextPath}/do_create_user" commandName="user">

<table class="formtable">
<tr>
	<td>Create User</td>
</tr>
<tr>
	<td class="label">Username: </td>
	<td><form:input class="control" path="username" name="username" type="text" /><br/>
	<form:errors path="username" cssClass="error"></form:errors></td>
</tr>
<tr>
	<td class="label">Password: </td>
	<td><form:input class="control"  path="password" name="password" type="text" /><br/>
	<form:errors path="password" cssClass="error"></form:errors></td>
</tr>
<tr>
	<td class="label">Email: </td>
	<td><form:input class="control"  path="email" name="email"></form:input><br/>
	<form:errors path="email" cssClass="error"></form:errors></td>
</tr>
<tr>
	<td class="label"> </td>
	<td><input class="control"  value="Create" type="submit" /></td>
</tr>
</table>

</form:form>
