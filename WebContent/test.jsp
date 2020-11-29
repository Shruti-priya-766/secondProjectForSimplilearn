<!DOCTYPE html>
<%@page import="java.util.Date"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FIrst JSP server</title>
</head>
<body>
<%out.println("JSPS look exciting!!");%>
<br>
<%out.println(new Date()); %>



<br>

<select>
<option>Please select any option: </option>
<%for (int i = 100; i<500; i = i+50){%>
<option><%out.println(i);%></option>
<%} %>
</select>

<%= "This looks quite shortened" %>
<br>
<%= new Date().toLocaleString() %>

</body>
</html>