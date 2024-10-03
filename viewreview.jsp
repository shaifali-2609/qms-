<%@page import="java.util.List"%>
<%@page import="helper.Connections"%>
<%@page import="pojoclass.Feedback"%>
<%@page import="dao.Userdao"%>
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
</head>
<body>

<%
    Admin add = (Admin) session.getAttribute("user");
    String role = (String) session.getAttribute("role");
    if(role==null||add==null||!role.equals("admin")){  
    	response.sendRedirect("login.jsp?error=true");
    	return;
    	
    }
    
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
       <a class="nav-link "  href="reply.jsp">Reply</a>
       
      
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
<div class=" container ml-20 mt-5">
<div class="card  ml-15 p-4"style="width: 50rem;">
<div class="card-body">
    <h5 class="card-title text-center">Feedback</h5>
<div class="container">
<table class="table">
  <thead>
    <tr>
      <th scope="col">Email</th>
      <th scope="col">FeedID</th>
      <th scope="col">FeedBackDate</th>
      <th scope="col">DeptID</th>
      
      <th scope="col">FeedBack</th>
      
      
    </tr>
   </thead>  
  
   
  <tbody>
  
  <%   

Userdao dao=new Userdao(Connections.getcon()); 
List<Feedback> com=dao.getallfeed();

for(Feedback comp:com ){
	%>
	<tr>
	<td><%=comp.getEmail()%></td>
	<td><%=comp.getFeedId() %></td>
	<td><%=comp.getFeedDate() %></td>
	<td><%=comp.getDeptId() %></td>
	<td><%=comp.getFeedDesc() %>
	</tr>
	<% }
	
	

%>
  
  
</tbody></table></div></div></div></div>


    


</body>
</html>
