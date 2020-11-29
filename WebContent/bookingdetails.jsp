<%@page import="org.apache.commons.lang3.RandomStringUtils"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%! PreparedStatement psmt; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookingDetails</title>
<link rel= 	"stylesheet" href = "style/main.css">
<style type="text/css">

table
{
text-align: left;
position: relative;
border-collapse: separate;
background-color: #f6f6f6;
padding: 5px;
width: 400px;
}
.container {
   margin-top:2%;
   margin-bottom:2%;
   height:96%;
   margin-left: 2%;
   margin-right:2%;
   width: 96%;
}
th
{
background-color: #d1e8f9;
border-radius: 0.5;
padding: 10px;

}

</style>
</head>
<body>

<div class = "container"> 
<%
try{
	
	String req = (String)request.getSession().getAttribute("flightno") ;
	//String flights  = request.getParameter("flightno");
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "");
	
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	String nonstop = request.getParameter("nonstop");
	
	psmt = connection.prepareStatement( "select * from flight_info where flight_id = ?");
	psmt.setString(1, req);
	
	
	ResultSet resultset = psmt.executeQuery();
	while(resultset.next()){
	%>

		<h1 align="center" style="color:#4F628E"><b>Your booking is Confirmed</b></h1>
		 <table style="border:1px double black" align = "center">
		 	<tr>
		 		    <th><b>Flight No</b></th>
		 		    <td><%= resultset.getString("flight_id")%></td>
		 	</tr>
		 	<tr>
		 		    <th><b>Source</b></th>
		 		    <td><%= resultset.getString("origin")%></td>
		 	</tr>
		 	<tr>
		 		    <th><b>Destination</b></th>
		 		    <td><%= resultset.getString("destination")%></td>
		 	</tr>
		 	<tr>
		 		    <th><b>Departure Date</b></th>
		 		    <td><%= resultset.getString("departure_date")%></td>
		 	</tr>
		 	<tr>
		 		    <th><b>Departure Time</b></th>
		 		    <td><%= resultset.getString("departure_time")%></td>
		 	</tr>
		 	<tr>
		 		   <th><b>Price</b></th>
		 		   <td><%= resultset.getInt("price")%></td>
		 	</tr>
		 	<tr>
		 		   <th><b>SeatNo</b></th>
		 		   <td><%=resultset.getString("flight_id")+ new Random().nextInt(55555) %></td>
		 	</tr>
		 	<tr>
		 		   <th><b>TransactionId</b></th>
		 		   <td><%= RandomStringUtils.randomAlphanumeric(15)%></td>
		 	</tr>

		 </table>
		
<%}
	
}
catch(Exception e){
	out.println("In wrong place "+e);
	
}
%>

</div>

</body>
</html>