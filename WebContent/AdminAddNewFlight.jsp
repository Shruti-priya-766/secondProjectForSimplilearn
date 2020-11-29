<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDate"%>
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

    <title>Add New Flight</title>
  </head>
  <body>
  <style>
  	.addFlightLabel{
		color:#4F628E;
	}
  </style>
    <div class="container">
        <div class="row">
            <div class="col-md-9 offset-md-1">
   <!-- FlightNo, Source, Destination, Fare, Departure, Arrival, Duration, AirportName, TotalStops, FlightName, Duration_in_hours, Duration_in_mins -->
                <div class="regForm">
                    <h1 style="text-align: center;color:#4F628E"><b>ADD NEW FLIGHT</b></h1>
                    <form action="addnewflight" method="POST">
                      <div class="form-group">
                            <label class="addFlightLabel">FLIGHT NO</label>
                            <input type="text" class="form-control" name="fltno" 
                            title="Must not contain Spaces"
                            placeholder="Add a flight no" pattern="[A-Za-z0-9]+" />
                        </div> 
                        
                        <div class="form-group">
                        	<label class="addFlightLabel">SOURCE&emsp;&emsp;&emsp;&ensp;:&emsp;</label>
                            <%
							Class.forName("com.mysql.jdbc.Driver");
							Connection dbcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "");
							String qry = "select distinct(origin) from flight_info;";
							Statement stmt = dbcon.createStatement();
							ResultSet  theresult = stmt.executeQuery(qry);
							%>
							<select name = "source">
							<option></option>
							<% while(theresult.next()){
							%>	
							<option><%= theresult.getString("origin") %></option>
							<%} %>
							</select>
							
							<label class="addFlightLabel">&emsp;DESTINATION&emsp;&ensp;:&emsp;</label>
							<%
							Class.forName("com.mysql.jdbc.Driver");
							Connection dbcon1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "");
							String qry1 = "select distinct(destination) from flight_info";
							Statement stmt1 = dbcon1.createStatement();
							ResultSet  theresult1 = stmt1.executeQuery(qry1);
							%>
							<select name = "destination" >
							<option></option>
							<% while(theresult1.next()){
							%>	
							<option><%= theresult1.getString("Destination") %></option>
							<%} %>
							</select>
                        </div>
                        
                        <div class="form-group">
                         <label class="addFlightLabel">FLIGHT NAME&emsp;:&emsp;</label>
                            <%
							Class.forName("com.mysql.jdbc.Driver");
							Connection dbcon2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "");
							String qry2 = "select distinct(flight_name) from flight_info;";
							Statement stmt2 = dbcon.createStatement();
							ResultSet  theresult2 = stmt2.executeQuery(qry2);
							%>
							<select name = "fltname" >
							<option></option>
							<% while(theresult2.next()){
							%>	
							<option><%= theresult2.getString("flight_name") %></option>
							<%} %>
							</select>
                        </div> 
                        
                        <div class="form-group">
                            <label class="addFlightLabel">PRICE</label>
                            <input type="text" class="form-control" name="fare" 
                            title="Must not contain Spaces and minimum 4 digits and maximum 5 digits"
                            placeholder="Enter Ticket Price" pattern="[0-9]{4,5}" />
                        </div>
                        
                       
                        
                        <div class="form-group" >
                          <label class="addFlightLabel">DEPARTURE AND ARRIVAL DATE</label><p>
  						  <input type="date" class="form-control" name = "departure_date" style="width: 40%; float: left" placeholder="Departure Date"/>
   						  <input type="date" class="form-control" name = "arrival_date" style="width: 40%; float: right" placeholder="Arrival Date"/>
 						 </div> 
                        
                         <br><br>
                        
                          <div class="form-group" >
                          <label class="addFlightLabel">DEPARTURE AND ARRIVAL TIME</label><p>
  						  <input type="time" class="form-control" name = "departure_time" style="width: 40%; float: left" placeholder="Departure Time"/>
   						  <input type="time" class="form-control" name = "arrival_time" style="width: 40%; float: right" placeholder="Arrival Time"/>
 						 </div> 
 						   
 						    <br><br>
 						    
 						  <div class="form-group">
                            <label class="addFlightLabel">TOTAL STOPS</label><br/>
                            <select class="form-control" name="totalstops"  style="width: 32%; float: left">
                                <option></option>
								<%for (int i = 0; i <=5; i++){%>
								<option><% out.println(i);%></option>
								<%
								}
								%>
                            </select>
                        </div><br>
                        <div class = "form-group">
                        <button type="submit" style="background-color:#4F628E;float: right;" class="btn btn-primary" name="register" style="width: 100%; float: left">CONFIRM</button>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>