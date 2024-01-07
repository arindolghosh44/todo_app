<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.Dao.*"%>
<%@page import="com.entity.*"%>
<%@page import="com.servlet.*"%>
<%@page import="java.util.*"%>
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
		url("images/admont-abbey-library-admont-austria-LIBRARY0319-2aa89cccb89d4f44b71181e64b54fbfb.jpg");
	height: 100vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

<meta charset="ISO-8859-1">
<title>index page</title>
<%@include file="component/all_css.jsp"%>
</head>
<body>


	<%@include file="component/navbar.jsp"%>






	<div class="container-fluid back-img">

		<%
		String regMsg = (String) session.getAttribute("reg-success");
		if (regMsg != null) {
		%>
		<div class="alert alert-success" role="alert"><%=regMsg%></div>

		<%
		session.removeAttribute("reg-success");

		}
		%>
		<%
					String FailedMsg = (String) session.getAttribute("failed-msg");
					if (FailedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%= FailedMsg %></div>

					<%
					session.removeAttribute("failed-msg");
					}
					%>
		<h1 class="text-center text-warning bg-primary">Todo</h1>

		<div class="container">

			<table class="table table-warning table-striped" border="1px">
				<thead class="bg-primary text-white text-center">
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Name</th>
						<th scope="col">Todo</th>
						<th scope="col">Status</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody class="text-center text-primary">
					<%
					TodoDAO dao = new TodoDAO(DBConnect.getConn());
					List<TodoDtls> todo = dao.getTodo();
					for (TodoDtls t : todo) {
					%>

					<tr>
						<th scope="row"><%=t.getId()%></th>
						<td><%=t.getName()%></td>
						<td><%=t.getStatus()%></td>
						<td><%=t.getTodo()%></td>
						<td><a href="edit.jsp?id=<%=t.getId()%>"
							class="btn btn-sm btn-success">Edit</a> <a href="delete?id=<%=t.getId()%>"
							class="btn btn-sm btn-danger">Delete</a></td>
					</tr>






					<%
					}
					%>








				</tbody>
			</table>


		</div>






	</div>













	<%@include file="component/footer.jsp"%>
</body>
</html>