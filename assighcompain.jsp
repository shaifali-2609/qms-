<%@page import="java.util.List"%>
<%@page import="helper.Connections"%>
<%@page import="dao.Userdao"%>
<%@page import="pojoclass.Complain"%>
<%@page import="pojoclass.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Assign Complaint</title>
</head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/cs.css">

<body>
<% Employee emp=(Employee) session.getAttribute("user");
String role= (String) session.getAttribute("role");

%>
<nav class="navbar navbar-expand-lg navbar-light bg-light primary-background text-white fixed-top">
  <a class="navbar-brand" href="#"><span class="fa fa-gears fa-2x"></span> QMS </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button> 

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">  
    <li class="nav-item">
        <a class="nav-link "  href="viewcomplain.jsp">View Complain</a>
      </li>
       <li class="nav-item">
       <a class="nav-link "  href="viewadminmsg.jsp">ViewAdmin messge</a>
       
      </li>
       <li class="nav-item">
        <a  class="nav-link "  href="replyDashboard.jsp">ViewReply</a>
        
      </li>
      </ul> 
      
      
      
      <ul class="navbar-nav mr-right">
   <li class="nav-item text-dark">
   <span class="fa fa-user-circle"><%=emp.getEmpName() %></span>
 
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp"><span class="fa fa-user-plus"></span>Logout</a>
      </li>
    </ul>
    </div></nav>
    
    <%Userdao dao=new Userdao(Connections.getcon()); 
    List<Complain> com=dao.getallcom();
    List<Employee> em=dao.getemp();
    
   %>
    
    <main class="mt-5 p-5">
    <div class="container">
        <div class="col-md-5 offset-md-3">
            <div class="card">
            
            <div class="container">
            
     
                <div class="card-header text-center">
                    <span class="fa fa-2x fa-user-circle">FeedBack</span><br/>
                </div>
                <div class="card-body">
                    <form id="regform" action="Assignservlet" method="post">
                        <div class="form-group">
    
    
    <h1>Assign Complaint</h1>
    
       <label for="complaintId">Complaint ID:</label>
<select class="form-control" id="complaintId" name="complainId" required>
    <option value="">Select Complaint ID</option>
    <% for (Complain comp : com) { %>
        <option value="<%= comp.getId() %>"><%= comp.getId() %></option>
    <% } %>
</select>
<br>
<label for="employeeId">Employee ID:</label>
<select class="form-control" id="employeeId" name="empId" required>
    <option value="">Select Employee ID</option>
    <% for (Employee e : em) { %>
        <option value="<%= e.getEmpId() %>"><%= e.getEmpId() %></option>
    <% } %>
</select>
       
                            <br>
        <input type="submit" value="Assign Complaint">
    </form></div></div></div></div></div></main>
</body>
</html>
