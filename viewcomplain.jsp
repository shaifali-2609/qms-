<%@page import="pojoclass.Customer"%>
<%@page import="pojoclass.Complain"%>
<%@page import="java.util.List"%>
<%@page import="helper.Connections"%>
<%@page import="dao.Userdao"%>
<%@page import="pojoclass.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/cs.css">
</head>
<body>
<% Employee emp=(Employee) session.getAttribute("user");
String role= (String) session.getAttribute("role");
if(role==null|| emp==null|| !role.equals("employee")){
	
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
     
      <li class="nav-item">
        <a class="nav-link" href="reply.jsp">Reply Customer</a>
        
      </li>
     
      
      <li class="nav-item">
        <a class="nav-link "  href="Quality.jsp"> Quality</a>
      </li>
       <li class="nav-item">
       <a class="nav-link "  href="Production.jsp">Prodcution</a>
       
      </li>
       <li class="nav-item">
        <a  class="nav-link "  href="Sales.jsp">Sales</a>
        
      </li> </ul> 
      
      
      
      <ul class="navbar-nav mr-right">
   <li class="nav-item text-dark">
 <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal">
          <span class="fa fa-user-circle"></span><%=emp.getEmpName() %></a> 
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp"><span class="fa fa-user-plus"></span>Logout</a>
      </li>
    </ul>
    </div></nav>
   <div class=" container ml-20 mt-5">
<div class="card  ml-15 p-4"style="width: 50rem;">
<div class="card-body">
    <h5 class="card-title text-center">Complains</h5>
<div class="container">
<table class="table">
  <thead>
    <tr>
      <th scope="col">ComplainID</th>
      <th scope="col">ComplainDate</th>
      <th scope="col">Complain</th>
      <th scope="col">Customer Email</th>
      
    </tr>
   </thead>  
  
   
  <tbody>
  
  <%   

Userdao dao=new Userdao(Connections.getcon()); 
List<Complain> com=dao.getallcom();
List<Customer> c=dao.getallcustomer();
for(Complain comp:com ){
	%>
	<tr>
	<td><%=comp.getId()%></td>
	<td><%=comp.getComdate() %></td>
	<td><%=comp.getComplain() %></td>
	<td><%=comp.getEmail()%></td>
	</tr>
	<% }
	
	

%>
  
  
</tbody></table></div></div></div></div>
<!-- Modal -->
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
          <h5 class="modal-title mt-3" id="exampleModalLabel"><%=emp.getEmpName() %></h5>
        </div>
        <div id="profile-details">
          <table class="table">
            <tbody>
              <tr>
                <th scope="row">Email:</th>
                <td><%=emp.getEmpemail() %></td>
              </tr>
              <tr>
                <th scope="row">EmpId:</th>
                <td><%=emp.getEmpId() %></td>
              </tr>
              <tr>
                <th scope="row">name:</th>
                <td><%=emp.getEmpName()
                %></td>
              </tr>
              <tr>
                <th scope="row">Role:</th>
                <td><%=emp.getRole() %></td>
              </tr>
              <tr>
              <th scope="row">DeptId</th>
              <td><%=emp.getDeptId()%></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
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
</body></html> 
      
