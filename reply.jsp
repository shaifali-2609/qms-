<%@page import="pojoclass.Complain"%>
<%@page import="helper.Connections"%>
<%@page import="dao.Userdao"%>
<%@page import="java.util.List"%>
<%@page import="pojoclass.Assigncom"%>
<%@page import="pojoclass.Employee"%>
<%@page import="helper.Messege"%>
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
}
%>
<%Userdao dao=new Userdao(Connections.getcon());
List <Assigncom> as=dao.getallasiign();
List<Complain> com=dao.getallcom();
List<Employee> em=dao.getemp();



%>


<nav class="navbar navbar-expand-lg navbar-light bg-light primary-background text-white fixed-top">
  <a class="navbar-brand" href="#"><span class="fa fa-gears fa-2x"></span> QMS </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
     
    
     
      
      <li class="nav-item">
        <a class="nav-link "  href="Quality.jsp"> Quality</a>
      </li>
       <li class="nav-item">
       <a class="nav-link "  href="Production.jsp">Prodcution</a>
       
      </li>
       <li class="nav-item">
        <a  class="nav-link "  href="Sales.jsp">Sales</a>
        
      </li>
      <li class="nav-item"><a  class="nav-link "  href="viewcomplain.jsp">View compain</a>
      
      </li>
      </ul> 
      
      
      
      <ul class="navbar-nav mr-right">
   <li class="nav-item text-dark">
   <span class="fa fa-user-circle"></span><%=emp.getEmpName() %>
 
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp"><span class="fa fa-user-plus"></span>Logout</a>
      </li>
    </ul>
    </div></nav>
    
    
    
    <main class="mt-5 p-5">
    <div class="container">
        <div class="col-md-5 offset-md-3">
            <div class="card">
                <div class="card-header text-center">
                    <span class="fa fa-3x fa-user-circle"></span><br/>
                    Reply here
                </div>
                <div class="card-body">
              <form id="regform" action="Replyservlet" method="post">
    <div class="form-group">
        <label for="rdate">Reply Date</label>
        <input name="rdate" type="date" class="form-control" id="rdate" placeholder="Enter date" required>
    </div>
    
    <div class="form-group">
        <label for="complainId">Complaint ID</label>
        <select class="form-control" id="complainId" name="complainId" required>
            <option value="">Select Complaint ID</option>
            <% for (Complain comp : com) { %>
                <option value="<%= comp.getId() %>"><%= comp.getId() %></option>
            <% } %>
        </select>
    </div>
    
    <div class="form-group">
        <label for="empId">Employee ID</label>
        <select class="form-control" id="empId" name="empId" required>
            <option value="">Select Employee ID</option>
            <% for (Employee e : em) { %>
                <option value="<%= e.getEmpId() %>"><%= e.getEmpId() %></option>
            <% } %>
        </select>
    </div>
    
    <div class="form-group">
        <label for="cemail">Customer Email</label>
        <select class="form-control" id="cemail" name="cemail" required>
            <option value="">Select Customer Email</option>
            <% for (Complain comp : com) { %>
                <option value="<%= comp.getEmail() %>"><%= comp.getEmail() %></option>
            <% } %>
        </select>
    </div>
    
    <div class="form-group">
        <label for="rmsg">Reply Message</label>
        <textarea name="rmsg" class="form-control" id="rmsg" rows="3" placeholder="Enter reply message" required></textarea>
    </div>
    
    <button type="submit" id="sbtn" class="btn btn-primary">Submit</button>
</form>
                    

    
    
                </div>
            </div>
        </div>
    </div>
</main>
    
    
    
   


</body>
</html>