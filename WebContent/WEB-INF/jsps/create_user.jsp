<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create User</title>
</head>
<body>

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

</body>
</html>