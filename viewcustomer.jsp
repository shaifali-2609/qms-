<%@page import="pojoclass.Customer"%>
<%@page import="java.util.List"%>
<%@page import="helper.Connections"%>
<%@page import="dao.Userdao"%>
<%@page import="pojoclass.Admin"%>
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
<% Admin add=(Admin) session.getAttribute("user");
String role=(String) session.getAttribute("role");

if(role==null || add==null || !role.equals("admin")){
	response.sendRedirect("login.jsp?error=true");
	return;
}





%><div class=" container ml-20 mt-5">
<div class="card  ml-15 p-4"style="width: 50rem;">
<div class="card-body">
    <h5 class="card-title text-center">Cutomers</h5>
<div class="container">
<table class="table">
  <thead>
    <tr>
      <th scope="col">Email</th>
      <th scope="col">FullName</th>
      <th scope="col">Mobile</th>
      <th scope="col">Status</th>
    </tr>
  </thead>  <tbody>
  
<%   

Userdao dao=new Userdao(Connections.getcon()); 

List<Customer> cus=dao.getallcustomer();
for( Customer cust:cus){
%>      
  <tr>
    
    <td><%=cust.getEmail() %></td>
    <td><%=cust.getFullname() %></td>
    <td><%=cust.getMobile() %></td>
    <td><%=cust.getStatus()%></td>
  </tr>
<% 
}
%>
  </tbody></table> </div>
</div></div></div>
</body>
</html>