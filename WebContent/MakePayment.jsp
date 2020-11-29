<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Registration Form</title>

	<style>
		.regiterLabel{
			color:#4F628E;
		}
		
	</style>
    
  </head>
  <body>
  	<%System.out.println("inside payment jsp"); %>
  	<% HttpSession sessionwlcm = request.getSession();%>
  	<% int adult = (int)sessionwlcm.getAttribute("adults"); %>
  	<% System.out.println(sessionwlcm.getAttribute("adults")); %>
  	<% System.out.println(sessionwlcm.getAttribute("price")); %>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="regForm">
                    <form action="bookingdetails.jsp" method="POST">
                    	<!--<h1>Total Billing Amount:</h1>-->
                    	<h1 align="center" style="color:#4F628E"><b>PASSENGER INFO</b></h1>
                    	<div class="form-group">
                    		<%for (int i = 1; i <= adult; i++){%>
                    		<label class="regiterLabel">PASSENGER NAME <%=i%></label>
							<input type="text" class="form-control" name="passenger_name" placeholder="Passenger Name <%=i%>" 
							pattern = "[A-Za-z]+" title= "Must not contain spaces" required>
							<%}%>
						</div>
						<h1 align="center" style="color:#4F628E"><b>MAKE PAYMENT</b></h1>
                        <div class="form-group">
                            <label class="regiterLabel">CARD NUMBER</label>
                            <input type="text" class="form-control" name="cardnumber" 
                            title="Must not contain Spaces or Alphabets"
                            placeholder="Enter your 16 digit Card number" pattern="[1-9]{1}[0-9]{15}" 
                            required/>
           
                        </div>       
                        <div class="form-group">
                            <label class="regiterLabel">NAME ON CARD</label>
                            <input type="text" class="form-control" name="nameoncard" 
                            placeholder="Enter Name Here" pattern = "[A-Za-z\s]+"
                            title="Must not contain Digits" required>
                            
                        </div>
                        <div class="form-group">
                            <label class="regiterLabel">EXPIRY DATE</label>
                            <select class="form-control" name="designation" required>
                                <option>Month</option>
								<%for (int i = 1; i <=12; i++){%>
								<option><% out.println(i);%></option>
								<%
								}
								%>
                            </select>
                            <select class="form-control" name="designation" required>
                                <option>Year</option>
								<%for (int j = 2022; j <=2028; j++){%>
								<option><% out.println(j);%></option>
								<%
								}
								%>
                            </select>
                            <div class="form-group">
                            <label class="regiterLabel">CVV</label>
                            <input type="password" class="form-control" name="cvv" placeholder = "Enter 3 digit CVV"
                            pattern = "[0-9]{3}" title="Can contain only 3 digits" required>
                        </div>
                        </div> 
                        <button type="submit" class="btn btn-primary" name="register" style="background-color:#4F628E">CONFIRM</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>