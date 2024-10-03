<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="pojoclass.Hr" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title><link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	 
	    <link rel="stylesheet" type="text/css" href="css/cs.css">
	<style>.container img {
    width: 100%;
    height: 600px;
   object-fit: cover;
    margin-top:5rem;
   
}</style>
 
</head>
<body style=" background-color: black;">

<% Hr h=(Hr) session.getAttribute("user");
String role=(String) session.getAttribute("role");
if(role==null||h==null||!role.equals("hr")){  
	response.sendRedirect("login.jsp?error=true");}
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light primary-background text-white fixed-top">
  <a class="navbar-brand" href="#"><span class="fa fa-gears fa-2x"></span> QMS </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
     
     
     
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-home"></span>Home <span class="sr-only ">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About Us</a>
      </li>
     
      <li class="nav-item">
        <a class="nav-link  href="#">Our Service</a>
      </li>
       <li class="nav-item">
        <a class="nav-link " href="#">Product</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="#">Contact us</a>
      </li>
    
        
      </li>
      <li class="nav-item"><a  class="nav-link "  href="https://www.naukri.com">Recuirment</a>
      
      </li>
      </ul> 
      
      
      
      <ul class="navbar-nav mr-right">
   <li class="nav-item text-dark">
   <span class="fa fa-user-circle"><%=h.getUsername()%></span>
 
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp"><span class="fa fa-user-plus"></span>Logout</a>
      </li>
    </ul>
    </div></nav>

<div class="container"><img src="image/hr.jpg" \>
</div>


</body>
</html>