<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

<title>PokeBook</title>
</head>
<body>
<h1>PokeBook</h1>
<table class="table table-striped table-warning">
	<thead>
		<tr>
			<th>Expense</th>
			<th>Vendor</th>
			<th>Amount</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="expense" items="${expenses}" >
		<tr>
			<td><c:out value="${expense.name}" ></c:out></td>
			<td><c:out value="${expense.vendor}"></c:out></td>
			<td>$<c:out value="${expense.amount}"></c:out></td>
			<td><a href="/expenses/edit/${expense.id}">Edit | </a><a href="/expenses/delete/${expense.id}">Delete</a></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<h2>Track an expense:</h2>
<form:form action="/expenses/new" method="post" modelAttribute="expense">
    <p>
        <form:label path="name">Expense Name:</form:label>
        <form:errors path="name"/>
        <form:input path="name"/>
    </p>
    <p>
        <form:label path="vendor">Vendor:</form:label>
        <form:errors path="vendor"/>
        <form:input path="vendor"/>
    </p>
    <p>
        <form:label path="amount">Amount:</form:label>
        <form:errors path="amount"/>     
        <form:input type="number" step="any" path="amount"/>
    </p>  
    <p>
        <form:label path="description">Description:</form:label>
        <form:errors path="description"/>     
        <form:textarea path="description"/>
    </p>    
    <input type="submit" value="Submit"/>
</form:form>    
</body>
</html>