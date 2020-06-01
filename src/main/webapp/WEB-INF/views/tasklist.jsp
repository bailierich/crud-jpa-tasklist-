<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link href="/style.css" rel="stylesheet" />
</head>
<body>

	<%@ include file="partials/header.jsp"%>

	<div class=container>
	
		<h4>
			<c:out value="${message}" />
		</h4>

		<h1>Task</h1>
		<table class=table>
			<thead>
				<tr>
					<th>Description</th>
					<th>Due Date</th>
					<th>Completed</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="task" items="${taskList}">
					<tr>
						<td><c:out value="${task.description}"></c:out></td>
						<td><c:out value="${task.date}"></c:out></td>
						<td>${task.completed? "Yes" : "No" }</td>
						<td><a class="btn btn-light" href="/tasks/${task.id}">DONE</a></td>
						<td><a class="btn btn-light"
							href="/tasks/edit-delete/${task.id}">EDIT/DELETE</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a class="btn btn-light" href="/tasks/add">ADD TASK</a>






	</div>



</body>
</html>