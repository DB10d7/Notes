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
  <body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Notes App</a>
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
              <a class="nav-link" href="register.jsp">Sign Up</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="login.jsp">Login</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Navbar End -->

    <div class="container">
      <div class="row mt-5">
        <div class="col-md-4 offset-md-4">
          <div class="card">
            <div class="card-header text-center">
              <li class="fa fa-user-circle-o fa-2x"></li>
              <h5>Registration Page</h5>
            </div>
            
            <%
            String regMsg=(String)session.getAttribute("reg-msg");
            String errMsg=(String)session.getAttribute("err-msg");
            if(regMsg != null){%>
					<div class="alert alert-success" role="alert"><%= regMsg %>  <a href="login.jsp">Login Here</a></div>
			<%}%>
            
            
            <div class="card-body text-center">
              <form action="registerServlet" method="post">
                <div class="mb-4">
                    <label for="exampleInputEmail1" class="form-label"
                      > Enter Your Name</label
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="exampleInputEmail1"
                      aria-describedby="emailHelp"
                      name="name"
                      required="required"
                    />
                  </div>
                <div class="mb-4">
                  <label for="exampleInputEmail1" class="form-label"
                    > Enter Your Email address</label
                  >
                  <input
                    type="email"
                    class="form-control"
                    id="exampleInputEmail1"
                    aria-describedby="emailHelp"
                    name="email"
                    required="required"
                  />
                </div>
                <div class="mb-4">
                  <label for="exampleInputPassword1" class="form-label"
                    >Enter Your Password</label
                  >
                  <input
                    type="password"
                    class="form-control"
                    id="exampleInputPassword1"
                    name="password"
                    required="required"
                  />
                </div>
                <button type="submit" class="btn btn-success btn-block">Register</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
