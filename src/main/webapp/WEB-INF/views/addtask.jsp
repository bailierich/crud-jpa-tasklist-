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

<main class="container">

		<article class="card mx-auto">

			<section class="card-body">

				<form action="/tasks/add" method="post">

					<div class="form-group">
						<label>Description</label> <input class="form-control"
							name="description" type="text" required />
					</div>
					
					<div class="form-group">
						<label>Due Date</label> <input class="form-control"
							name="date" type="text" placeholder="YYYY-DD-MM" required />
					</div>

					<button class="btn btn-block btn-secondary">Add Task</button>

				</form>

			</section>

		</article>

	</main>






</body>
</html>