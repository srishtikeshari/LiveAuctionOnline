<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" type="text/css">
    <link href="addproduct.css" rel="stylesheet">
    <title>Registration</title>
  </head>
  
    <body >
      <form action="registeruser" method="post">
        <div class="form-row">
          <div class="col-md-12 mb-12">
            <label for="validationDefault01">Name</label>
            <input type="text" name="name"  class="form-control" id="validationDefault01" placeholder="First name" required>
          </div>

        </div>
        
        <div class="form-row">
          <div class="col-md-6 mb-3">
            <label for="validationDefaultUsername">Username</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupPrepend2">@</span>
              </div>
              <input type="text" name="username" class="form-control" id="validationDefaultUsername" placeholder="Username" aria-describedby="inputGroupPrepend2" required>
            </div>
            

          </div>
          <div class="col-md-6 mb-6">
            <label for="start-date">Birth Date</label>
            <input type="date" name="birthdate" class="form-control"  placeholder="select birthday date"  required>
          </div>
        </div>
        <div class="form-row">
          <div class="col-md-12 mb-12">
            <label for="">Address</label>
            <input type="text" name="street" class="form-control"  placeholder="Address"  required>
          </div>
          
        </div>
        

        <div class="form-row">
          <div class="col-md-3 mb-3">
            <label for="">Country</label>
            <input type="text" name="country" class="form-control" placeholder="Country" required>
          </div>
          <div class="col-md-3 mb-3">
            <label > City </label>
            <input type="text" name="city" class="form-control" placeholder="City" required>
          </div>
          <div class="col-md-3 mb-3">
            <label for="validationDefault04">State</label>
            <input type="text" name="state" class="form-control"  placeholder="State" required>
          </div>
          <div class="col-md-3 mb-3">
            <label for="validationDefault05">Pincode</label>
            <input type="number" name="pincode" class="form-control"  placeholder="Zip" required>
          </div>
        </div>
        <div class="form-row">
          <div class="col-md-6 mb-6">
            <label for="validationDefault01">Contact Number</label>
            <input type="number" name="contactno" class="form-control"  placeholder="Contact No." required>
          </div>
          <div class="form-group col-md-6">
            <label for="inputEmail4">Email</label>
            <input type="email" name="email" class="form-control"  placeholder="Email">
          </div>
          
          
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputPassword4">Password</label>
            <input type="password" name="password" class="form-control"  placeholder="Password">
          </div>
        
          <div class="form-group col-md-6">
            <label for="inputPassword4">ConfirmPassword</label>
            <input type="password" name="cpassword" class="form-control" placeholder="Password">
          </div>
        
          
          
        </div>
        <div class="form-group">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
            <label class="form-check-label" for="invalidCheck2">
              Agree to terms and conditions
            </label>
          </div>
        </div>
        <button class="btn btn-primary" type="submit">Register <i class="fa fa-check"></button>
      </form> </body>
   <!-- Optional JavaScript; choose one of the two! -->
   
   <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

  
 
</html>