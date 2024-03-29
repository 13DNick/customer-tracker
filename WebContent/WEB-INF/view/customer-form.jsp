<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Save Customer</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"></link>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/add-customer-style.css"></link>
</head>

<body>
	
	<div id="wrapper">
			<div id="header">
				<h2>Customer Manager</h2>
			</div>
			
			<div id="container">
				<h3>Save Customer</h3>
			</div>
			
			<form:form action="saveCustomer" modelAttribute="customer" method="POST">
				
				<form:hidden path="id"/>
				
				<table>
					<tbody>
						<tr>
							<td><label>First name:</label></td>
							<td><form:input path="firstName"/></td>
						</tr>
						<tr>
							<td><label>Last name:</label></td>
							<td><form:input path="lastName"/></td>
						</tr>
						<tr>
							<td><label>Email:</label></td>
							<td><form:input path="email"/></td>
						</tr>
						<tr>
							<td><label></label></td>
							<td><input type="submit" value="Save" class="save"/></td>
						</tr>
					</tbody>
				</table>
				
			</form:form>
			
			<div style="clear; both;"></div>
			<p> 
				<a href="${pageContext.request.contextPath}/customer/list">Back to List</a>
			</p>
	</div>
	
</body>
</html>