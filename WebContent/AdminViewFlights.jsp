<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%!
PreparedStatement psmt;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<title>Flights</title>
<style type="text/css">
b
{
backgroud-color:cyan;
box-shadow:5px 5px 5px;
width:420px;
}
table
{
text-align: center;
position: relative;
border-collapse: collapse;
background-color: #f6f6f6;
}
th
{
background-color: #4F628E;
color:white;
border-radius: 0.5;
padding: 10px;

}
.container {
   width: 100%;
   margin:auto;
}


//

</style>
</head>
<body>
<div class = container>

<h5 align="center">Flight Details</h5>

<table class="striped" >
<tr style="border:1px double black;">
<th><b>FlightName</b></th>
<th><b>Flight No</b></th>
<th><b>Source</b></th>
<th><b>Destination</b></th>
<th><b>Departure</b></th>
<th><b>Arrival</b></th>
<th><b>Number of stop</b></th>
<th><b>Price</b></th>
<th><b></b></th>
<th><b></b></th>
</tr>

<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "");
	psmt = connection.prepareStatement( "Select * from flight_info");
	ResultSet resultset = psmt.executeQuery();
	while(resultset.next()){
%>
<tr class="blank_row">
<td colspan="0.5"></td>
</tr>
<tr style="border:1px dotted black">
<td ><%= resultset.getString("flight_name")%></td>
<td ><%= resultset.getString("flight_id")%></td>
<td ><%= resultset.getString("origin")%></td>
<td ><%= resultset.getString("destination")%></td>
<td ><%= resultset.getString("departure_date")+" "+resultset.getString("departure_time")%></td>
<td ><%= resultset.getString("arrival_date")+" "+resultset.getString("arrival_time")%></td>
<td ><%= resultset.getString("number_of_stop")%></td>
<td ><%= resultset.getInt("price")%></td>
<td><a class="btn" style="background-color:#4F628E" href="<%= request.getContextPath() %>/admindelete?flightno=<%= resultset.getString("flight_id")%>">Delete</a></td>
<td><a class="btn" style="background-color:#4F628E" href="<%= request.getContextPath() %>/adminedit?flightno=<%= resultset.getString("flight_id")%>">Edit</a></td>

</tr>


<%
}
	
}
catch(Exception e){
	out.println("In wrong place "+e);
	
}

%>


</table>
</div>
</body>
</html>