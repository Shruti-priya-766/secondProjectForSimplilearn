<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<title>Register</title>
</head>
<body>
	<h3>
		<b></b>
	</h3>
	<div class="container">
		<div class="row">
			<div class="col m9 offset-m1">
				<div class="card">
					<div class="card-content">
						<h2 style="margin-top: 10px;" class="center-align"><b>Register Account</b></h2>

						<div class="form">
							<form action="adduser" method="post">
								USERNAME
								<input type="text" name="username" placeholder="username" 
								pattern = "[A-Za-z0-9]+" title= "Must not contain spaces" required>
								PASSWORD
								<input type="password" name="password" placeholder="password" 
								title = "Must be Alpha-numeric"	 pattern = "[\w]+"  required>
								FIRST NAME
								<input type="text" name="fname" placeholder="username" 
								pattern = "[A-Za-z\s]+" required>
								LAST NAME
								<input type="text" name="lname" placeholder="username" 
								pattern = "[A-Za-z\s]+"required>
								EMAIL
								<input	type="email" name="email" placeholder="Please enter a valid email address" required = "required">
								MOBILENO
								<input	type="text" name= "mobileno" placeholder="Please enter a valid mobile" 
								pattern = "[7-9]{1}[0-9]{9}" title = "Must start with 7,8 or 9" required = "required">
								<button type="submit" class="btn">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>