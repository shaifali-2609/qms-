<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/cs.css">
</head>
<body>
<%@include file="nav.jsp" %>
<main class="mt-5 p-5">
    <div class="container">
        <div class="col-md-5 offset-md-3">
            <div class="card">
                <div class="card-header text-center">
                    <span class="fa fa-3x fa-user-circle"></span><br/>
                    Register here
                </div>
                <div class="card-body">
                    <form id="regform" action="Registerserv" method="post">
                        <div class="form-group">
                            <label for="emailid">Email</label>
                            <input name="cemail" type="text" class="form-control" id="cemail" aria-describedby="emailHelp" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input name="cpass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label for="mobile">Mobile no</label>
                            <input name="cmob" type="text" class="form-control" id="exampleInputmobile" placeholder="Phone number">
                        </div>
                        <div class="form-group">
                            <label for="name">Full Name</label>
                            <input name="cname" type="text" class="form-control" id="exampleinputfullname" placeholder="Full name">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Status</label>
                            <input name="cstatus" type="text" class="form-control" id="exampleInputstatus" placeholder="Status">
                        </div>
                       <div class="form-check">
                            <input name="ccheck" type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                        </div><br/> 
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
