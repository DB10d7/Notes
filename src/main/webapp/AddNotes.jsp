<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.*" %>
<%@page import="com.entites.User" %>
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
      crossorigin="anonymous"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="css/style.css" />
    <title>Notes App</title>
  </head>
  <body style="background-image: linear-gradient(to right top, #bbc22a, #b7ae20, #b19a1a, #a98716, #9f7515); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="AddNotes.jsp">AddNotes</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">NotesList</a>
            </li>
          </ul>
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" data-bs-toggle="modal"
				data-bs-target="#exampleModal" aria-current="page" href="index.jsp"
                ><%= user.getName()%></a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logoutServlet">Logout</a>
            </li>
          </ul>
        </div>
			<!-- Modal -->
			<div
          class="modal fade"
          id="exampleModal"
          tabindex="-1"
          aria-labelledby="exampleModalLabel"
          aria-hidden="true"
        >
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
                  <button
                    type="button"
                    class="btn btn-danger"
                    data-bs-dismiss="modal"
                  >
                    Close
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
		</div>
    </nav>

    <!-- Navbar End -->

	<div class="container">
      <div class="row justify-content-center align-item-center">
        <div class="col-md-6 mt-5">
          <form class="text-center" action="addNoteServlet" method="post">
            <div class="mb-3">
              <label for="exampleInputEmail1" class="form-label">Title</label>
              <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title" required="required" placeholder="Enter the Title of Your Note Here">
            </div>
            <div class="mb-3">
              <label for="exampleInputPassword1" class="form-label">Body</label>
              <textarea class="form-control" id="exampleFormControlTextarea1" rows="7" name="body" required="required" placeholder="Enter the Body of Your Note Here"></textarea>
            </div>
            <input type="hidden" value="<%= user.getName() %>" name="author">
            <input type="hidden" value="<%= user.getId() %>" name="userId">
            <button type="submit" class="btn btn-success">Add Note</button>
          </form>
        </div>
      </div>
    </div>

  </body>
</html>
<%}%>