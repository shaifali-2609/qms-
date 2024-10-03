<%@page import="helper.Messege"%>
<%@ page import="pojoclass.Customer" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Feedback</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/cs.css">
</head>
<body>
<%
    Customer cuser = (Customer) session.getAttribute("user");
    String role = (String) session.getAttribute("role");
    if (cuser == null || role == null || !role.equals("customer")) {
        response.sendRedirect("login.jsp?error=true");
    return;}
    
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light primary-background text-white fixed-top">
    <a class="navbar-brand" href="#"><span class="fa fa-gears fa-2x"></span> QMS </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">About Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Our Service</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Product</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contact us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="complain.jsp">Complain</a>
            </li>
        </ul>

        <ul class="navbar-nav mr-right">
            <li class="nav-item text-dark">
                <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal">
                    <span class="fa fa-user-circle"></span> 
                        <%= cuser.getFullname() %>
                    
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp"><span class="fa fa-user-plus"></span> Logout</a>
            </li>
        </ul>
    </div>
</nav>
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">QualityManagmentSystem</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
          <h5 class="modal-title mt-3" id="exampleModalLabel"><%=cuser.getFullname() %></h5>
        </div>
        <div id="profile-details">
          <table class="table">
            <tbody>
              <tr>
                <th scope="row">Email:</th>
                <td><%=cuser.getEmail() %></td>
              </tr>
              <tr>
                <th scope="row">Your Name:</th>
                <td><%=cuser.getFullname() %></td>
              </tr>
              <tr>
                <th scope="row">Status:</th>
                <td><%=cuser.getStatus() %></td>
              </tr>
              <tr>
                <th scope="row">Mobile:</th>
                <td><%=cuser.getMobile() %></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<main class="mt-5 p-5">
    <div class="container">
        <div class="col-md-5 offset-md-3">
            <div class="card">
            
            <div class="container">
            
     
                <div class="card-header text-center">
                    <span class="fa fa-2x fa-user-circle">FeedBack</span><br/>
                </div>
                <div class="card-body">
                    <form id="regform" action="feedbackservlet" method="post">
                        <div class="form-group">
                            <label for="cemail">Email</label>
                            <input name="cuemail" type="email" class="form-control" id="cemail" aria-describedby="emailHelp" placeholder="Enter email" required>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Status</label>
                            <input name="custatus" type="text" class="form-control" id="exampleInputstatus" placeholder="Status">
                        </div>
                        <div class="form-group">
                            <label for="cufd">Feedback Date</label>
                            <input name="cufd" type="date" class="form-control" id="cufd" placeholder="Feedback date" required>
                        </div>
                        <div class="form-group">
                            <label for="id">Department </label>
                            <select class="form-control" id="id" name="id" required>
                                <option value="111">Sales</option>
                                <option value="222">Quality</option>
                                <option value="333">Production</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="desc">Feedback</label>
                            <textarea name="desc" class="form-control" id="desc" rows="3" placeholder="Enter feedback" required></textarea>
                        </div>
                        <button type="submit" id="sbtn" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9O/f6Jp+rNzg04locFqX7S/6n+8wpK4l6w8bh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
