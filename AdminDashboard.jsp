<%@ page import="pojoclass.Admin" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<!-- CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/cs.css">
<style>.container img {
    width: 100%;
    height: 600px;
   object-fit: cover;
    margin-top:5rem;
   
}</style>
</head>
<body style="background-color:black">

<%
    Admin add = (Admin) session.getAttribute("user");
    String role = (String) session.getAttribute("role");
    if(add==null||role==null||!role.equals("admin"))
    return ;
  %>
    
    <nav class="navbar navbar-expand-lg navbar-light bg-light primary-background text-white fixed-top">
  <a class="navbar-brand" href="#"><span class="fa fa-gears fa-2x"></span> QMS </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active"><a class="nav-link " href="addEmployeeManagmemt.jsp">Employee</a>
      
      </li>
      <li class="nav-item">
       
       <a class="nav-link" href="viewcustomer.jsp">Customer</a>
        
      </li>
     
      <li class="nav-item">
        <a class="nav-link "  href="department.jsp">Department</a>
      </li>
      <li class="nav-item">
        <a class="nav-link "  href="viewdepartment.jsp"> View Department</a>
      </li>
       <li class="nav-item">
       <a class="nav-link "  href="viewrepy.jsp">Reply</a>
       
      </li>
       <li class="nav-item">
        <a  class="nav-link "  href="viewreview.jsp">Review</a>
        
      </li>
      </li>
       <li class="nav-item">
        <a  class="nav-link "  href="adminmsg.jsp">Messge</a>
        
      </li>
      <li class="nav-item"><a  class="nav-link "  href="replyhead.jsp">Head</a>
      
      </li>
      </ul> 
      
      
      
      <ul class="navbar-nav mr-right">
   <li class="nav-item text-dark">
   <span class="fa fa-user-circle"></span><%=add.getUsername() %></a>
 
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp"><span class="fa fa-user-plus"></span>Logout</a>
      </li>
    </ul>
    
  </div>
</nav>



<div class="container"><img src="image/admin.jpg"\>
</div>



   <script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
    


</body>
</html>
