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
box-shadow:2px 2px 2px;
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
border-radius: 0.5;
padding: 10px;

}
.container {
   margin: auto;
    width: 100%;
}




</style>
</head>
<body>
<div class = container>

<h3 align="center" style="color:#4F628E"><b>Flight Details</b></h3>


<table class="left" >

<tr><td><b>From</b>  : <%= request.getParameter("from") %></td> 
<td> <b>To</b> : <%= request.getParameter("to") %></td>
<td> <b>Travel Date</b> : <%= request.getParameter("date") %></td>
</tr>




<tr style="border:1px double black;">
<th><b>Flight Name</b></th>
<th><b>Flight No</b></th>
<th><b>Source</b></th>
<th><b>Destination</b></th>
<th><b>Departure</b></th>
<!--<th><b>Duration</b></th>-->
<th><b>Arrival</b></th>
<th><b>Price</b></th>
<th><b>Stop</b></th>
<th><b></b></th>




</tr>

<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "");
	
	HttpSession sessionwlcm = request.getSession();
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	String nonstop = request.getParameter("nonstop");
	int adults = Integer.parseInt(request.getParameter("adultseats"));
	//int children = Integer.parseInt(request.getParameter("childrenseats"));
	
	out.println(from);
	out.println(to);
	out.println(nonstop);
	out.println(adults);
	//out.println(children);
	
	sessionwlcm.setAttribute("from", from);
	sessionwlcm.setAttribute("to", to);
	sessionwlcm.setAttribute("nonstop", nonstop);
	sessionwlcm.setAttribute("adults", adults);
	//sessionwlcm.setAttribute("children", children);
	
	if (from!=null && to!=null && nonstop!=null){
		psmt = connection.prepareStatement( "Select * from flight_info where origin = ? and destination = ? and number_of_stop = 0");
	}else if (from!=null && to!=null){
		psmt = connection.prepareStatement( "Select * from flight_info where origin = ? and destination = ?");
	}


	psmt.setString(1, from);
	psmt.setString(2, to);
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
<td ><%= resultset.getString("price")%></td>
<td ><%= resultset.getString("number_of_stop")%></td>
<td><a class="btn" style="background-color:#4F628E" href="<%= request.getContextPath() %>/main?page=login&flightno=<%= resultset.getString("flight_id")%>&adult=<%= adults %>&price=<%= resultset.getString("price")%>">Book Now</a></td>

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