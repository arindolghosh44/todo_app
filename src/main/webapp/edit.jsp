<%@page import="com.entity.*"%>
<%@page import="com.Dao.TodoDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background:
		url("images/5aebb8dc-88b2-4c52-9062-bdc3564393e9c835993bd05329aec6_34800862940_f7f3a7e596_k.jpg");
	height: 100vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>add_todo page</title>
<%@include file="component/all_css.jsp"%>
</head>
<body>


	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<div class="container text-center mt-3 ">
			<div class="row p-5">
				<div class="col-md-6 offset-md-3">
					<div class="card mt-3">
						<%
						String FailedMsg = (String) session.getAttribute("failed-msg");
						if (FailedMsg != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=FailedMsg%></div>

						<%
						session.removeAttribute("failed-msg");
						}
						%>
						<div class="card-body bg-primary bg-striped" border="1px">
							<h3 class="text-center text-warning">Add Todo</h3>
							<%
							int id = Integer.parseInt(request.getParameter("id"));
							TodoDAO dao = new TodoDAO(DBConnect.getConn());
							TodoDtls t = dao.getTodoById(id);
							%>
							<form action="update" method="post">
								<input type="hidden" value="<%=t.getId()%>" name="id">




								<div class="form-group">
									<label for="exampleInputEmail1 text-primary">Name</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="name"
										value="<%=t.getName()%>">

								</div>
								<div class="form-group">
									<label for="exampleInputEmail1 text-primary">Todo</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="todo"
										value="<%=t.getTodo()%>">


								</div>
								<div class="form-group">
									<label for="inputState">Status</label> <select id="inputState"
										class="form-control" name="status">
										<%
										if ("Pending".equals(t.getStatus())) {
										%>
										<option value="Pending">Pending</option>
										<option value="Complete">Complete</option>
										<%
										} else {
										%>
										<option value="Complete">Complete</option>
										<option value="Pending">Pending</option>

										<%
										}
										%>


									</select>
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-success">Update</button>
								</div>

							</form>
						</div>


					</div>


				</div>


			</div>



		</div>


	</div>