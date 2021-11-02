<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Customers</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<script>
	function confirmDelete(event) {
		const result = confirm('Are you sure want to delete this student?');
		if (!result)
			event.preventDefault();
	}
</script>
</head>
<body>
	<div is="wrapper">
		<div id="header">
			<h2>Customer management - CRM</h2>
		</div>
	</div>

	<div id="container">
		<div id="content">
			<input type="button" value="Add Customer"
				onclick="window.location.href='showFormForAdd'; return false;"
				class="add-button" />
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>

				<c:forEach var="tempCustomer" items="${customers}">
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${ tempCustomer.id }"></c:param>
					</c:url>

					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${ tempCustomer.id }"></c:param>
					</c:url>
					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						<td><a href="${updateLink}">Update</a> | <a
							href="${deleteLink}" onclick="confirmDelete(event)">Delete</a></td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>
</body>
</html>