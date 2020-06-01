<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="/style.css" rel="stylesheet" />
</head>
<body>

<%@ include file="partials/header.jsp"%>

<form action="/tasks/edit-delete" method="post">
			<input type="hidden" name="id" value="${ task.id }" />
			<div class="form-group">
			    <label for="description">Description</label>
			    <input class="form-control" id="description" name="description" value="${ task.description }" required minlength="2" autocomplete="off">
			</div>
			<div class="form-group">
			    <label for="date">Due Date</label>
			    <input class="form-control" id="date" name="date" value="${ task.date }" required minlength="2" autocomplete="off">
			</div>
			<div class="form-group">
			    <label for="Completed">Completed</label>
			    <select class="form-control" id="completed" name="completed">
			    <option id="completed" value="true">Complete</option>
			    <option id="completed" value="false">Not Complete</option>
			    </select>
			</div>
			<button type="submit" class="btn btn-primary">Save</button>
			<a href="/tasks/delete/${task.id}" class="btn btn-link">Delete</a>
			<a href="/tasks" class="btn btn-link">Cancel</a>
		</form>






</body>
</html>