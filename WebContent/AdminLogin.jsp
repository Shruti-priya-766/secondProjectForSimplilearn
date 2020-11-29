<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminLogin</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col m9 offset-m1">
				<div class="card">
					<div class="card-content">
						<h2 style="margin-top: 10px;" class="center-align"><b>Admin Login</b></h2>

						<div class="form">
							<form action="adminlogin" method="post">
								USERNAME
								<input type="text" name="adminusername" placeholder="username" required = "required"><br>
								PASSWORD
								<input type="password" name="adminpassword" placeholder="password" 
								title = "Must be Alpha-numeric"	 pattern = "[A-Za-z0-9]+" required>
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