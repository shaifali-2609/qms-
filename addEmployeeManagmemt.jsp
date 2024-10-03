<!DOCTYPE html>
<%@page import="pojoclass.Admin"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Employee Registration Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/cs.css">
</head>
<body>
<%
    Admin add = (Admin) session.getAttribute("user");
    String role = (String) session.getAttribute("role");
    
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
        <a  class="nav-link "  href="reviewDashboard.jsp">Review</a>
        
      </li>
      <li class="nav-item"><a  class="nav-link "  href="replyhead.jsp">Head</a>
      
      </li>
      </ul> 
      
      
      
      <ul class="navbar-nav mr-right">
   <li class="nav-item text-dark">
   <span class="fa fa-user-circle"></span><a href=" <%=add.getUsername()%>">
                       </a>
                    
 
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp"><span class="fa fa-user-plus"></span>Logout</a>
      </li>
    </ul>
    
  </div>
</nav>




<main class="mt-5 p-5">
    <div class="container">
        <div class="col-md-5 offset-md-3">
            <div class="card">
                <div class="card-header text-center">
                    <span class="fa fa-3x fa-user-circle"></span><br/>
                   Employee
                </div>
                <div class="card-body">
                <form id="regform" action="Employeeservlet" method="post">
                        <div class="form-group">
                            <label for="ename">Employee Name</label>
                            <input name="ename" type="text" class="form-control" id="eemail" aria-describedby="emailHelp" placeholder="Enter name">
                        </div>
                    
                        <div class="form-group">
                            <label for="emailid">Email</label>
                            <input name="eemail" type="email" class="form-control" id="eemail" aria-describedby="emailHelp" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input name="epass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
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
                <label for="role">Designation:</label>
                <select  style ="background-color: primary-bckground"id="role" name="role" required >
                 
                    <option value="manager">Manager</option>
                    <option value="employee">Employee</option>
                    
                    
                </select>
            </div>
                        
                        
                       
                        <div class="container text-center" id="loader" style="display:none;">
                            <span class="fa fa-refresh fa-3x fa-spin"></span><h3>Please wait...</h3>
                        </div><br/>
                        <button type="submit" id="sbtn" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script type="text/javascript" src="javascript/newjs.js"></script>

</body>
</html>
