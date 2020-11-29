<%@page import="java.time.LocalDate"%>
<%@page import="java.time.ZoneId"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<meta charset="ISO-8859-1">
<title>Main</title>
</head>
<body background="#f6f6f6">
	<div class="container">
		<div class="row">
			<div class="col m9 offset-m1">
				<div class="card">
					<div class="card-content">
						<h2 style="margin-top: 10px;" class="center-align"><b>Book Flight</b></h2>
						<div class="form">
							<form action="" method="post">
								FROM<input type="text" name="from" placeholder="From" required="required"> 
								 TO<input type="text" name="to" placeholder="To" required="required">	
								Departure Date<input type="date" name="date" min=<%= LocalDate.now().plusDays(1)	%>
									placeholder="your journey date" required="required"> 
								TotalSeat<input	type="text" name="totalseat" placeholder="Number of Seat" required="required">
									<input type="checkbox" class="filled-in" checked="checked" />
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