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
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="index.jsp"
                >Home</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logoutServlet">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Navbar End -->


    <div class="container mt-5">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-6">
                <div class="card">
                
               
                
                    <div class="card-title text-center">
                        <h1>User Details</h1>
                    </div>
                    <div class="card-body">
                        <h3>Name : <%= user.getName()%></h3>
                        <h3>Email : <%= user.getEmail()%></h3>
                    </div>
               
                </div>
            </div>
        </div>
    </div>

  </body>
</html>
<%}%>