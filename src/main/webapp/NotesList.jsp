<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.*"%>
<%@page import="com.entites.User"%>
<%@page import="com.entites.Notes"%>
<%@page import="java.util.*"%>
<%@page import="com.DAO.NotesDAO"%>
<% User user=(User)session.getAttribute("user-obj");
	if(user==null){
		session.setAttribute("err-login-msg","Please Login First");
		response.sendRedirect("login.jsp");
	}else{
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="css/style.css" />
<title>Notes App</title>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Notes App</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="AddNotes.jsp">AddNotes</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="NotesList.jsp">NotesList</a>
					</li>
				</ul>
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						data-bs-toggle="modal" data-bs-target="#exampleModal"
						aria-current="page" href="#"><%= user.getName()%></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="logoutServlet">Logout</a>
					</li>
				</ul>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content text-center">
						<div class="modal-body">
							<div class="container text-center">
								<i class="fa fa-user fa-3x"></i>
								<h3>User Details</h3>
								<table class="table">
									<tbody>
										<tr>
											<th>User Id:</th>
											<td><%= user.getId()%></td>
										</tr>
										<tr>
											<th>Name:</th>
											<td><%= user.getName()%></td>
										</tr>
										<tr>
											<th>Email Id:</th>
											<td><%= user.getEmail()%></td>
										</tr>
									</tbody>
								</table>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<!-- Navbar End -->
	<%
	String notesUpdateMsg=(String)session.getAttribute("notes-update-msg");
		if (notesUpdateMsg != null) {
	%>
	<div class="alert alert-success text-center" role="alert"><%=notesUpdateMsg%></div>
	<%
	session.removeAttribute("notes-update-msg");
	}
	%>
	<%
	String errNotesUpdateMsg=(String)session.getAttribute("err-notes-update-msg");
		if (errNotesUpdateMsg != null) {
	%>
	<div class="alert alert-danger text-center" role="alert"><%=errNotesUpdateMsg%></div>
	<%
	session.removeAttribute("err-notes-update-msg");
	}
	%>
	<%
	String notesDeleteMsg=(String)session.getAttribute("notes-delete-msg");
		if (notesDeleteMsg != null) {
	%>
	<div class="alert alert-success text-center" role="alert"><%=notesDeleteMsg%></div>
	<%
	session.removeAttribute("notes-delete-msg");
	}
	%>
	<%
	String errNotesDeleteMsg=(String)session.getAttribute("err-notes-delete-msg");
		if (errNotesDeleteMsg != null) {
	%>
	<div class="alert alert-danger text-center" role="alert"><%=errNotesDeleteMsg%></div>
	<%
	session.removeAttribute("err-notes-delete-msg");
	}
	%>
	<%
	String notesAddMsg=(String)session.getAttribute("notes-add-msg");
		if (notesAddMsg != null) {
	%>
	<div class="alert alert-success text-center" role="alert"><%=notesAddMsg%></div>
	<%
	session.removeAttribute("notes-add-msg");
	}
	%>
	<%
	String errNotesAddMsg=(String)session.getAttribute("err-notes-add-msg");
		if (errNotesAddMsg != null) {
	%>
	<div class="alert alert-danger text-center" role="alert"><%=errNotesAddMsg%></div>
	<%
	session.removeAttribute("err-notes-add-msg");
	}
	%>
	<div class="container">
		<h2 class="text-center">ALL NOTES</h2>

		<div class="row">
			<%
					NotesDAO ob = new NotesDAO(DBConnect.getConnection());
					ArrayList<Notes> note = ob.getData(user.getId());
					for (Notes no : note) {
					%><div class="col-md-6">
				<div class="card mt-3">
					<div class="card-body p-4">
						<h5 class="card-title text-center"><%=no.getTitle()%></h5>
						<p><%=no.getBody()%></p>
						<p>
							<b class="text-success">Published By: <span
								class="text-primary"> <%=user.getName()%>
							</span></b>
						</p>
						<p>
							<b class="text-success">Published Date: <span
								class="text-primary"> <%=no.getnDate()%>
							</span></b>
						</p>
						<div class="container text-center mt-2">
							<a href="NotesEdit.jsp?note_id=<%= no.getId() %>"
								class="btn btn-primary">Edit</a> 
								<a
								data-bs-toggle="modal"data-bs-target="#exampleModals" 
								class="btn btn-danger">Delete</a>
						</div>
						<div class="modal fade" id="exampleModals" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header justify-content-center">
										<h3 class="modal-title text-danger" id="exampleModalLabel">Delete
											Alert</h3>
									</div>
									<div class="modal-body text-center">
										<h5>Do You Want To Delete Your Note?</h5>
									</div>
									<div class="modal-footer">
										<a href="NotesDeleteServlet?note_id=<%= no.getId() %>"
											class="btn btn-danger">Confirm Delete</a>
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Cancel</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%}%>
		</div>
	</div>

</body>
</html>
<%}%>