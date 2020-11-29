package com.shruti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addnewflight")
public class AdminAddFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement psmt;
	private Connection	connection;
	
       
	public void init() {
		try {
			
			System.out.println("Inside the userlogin init method");
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "");
			
			String query = "Insert into flight_info (flight_name,flight_id,origin,destination,departure_date,departure_time,arrival_date,arrival_time,number_of_stop,price)"
					+ "values (?,?,?,?,?,?,?,?,?,?);";
			psmt = connection.prepareStatement(query);

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Inside exception block of adminaddflight servlet init"+e);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().println("inside do post of addnewflight method");
	
		PrintWriter out = response.getWriter();
		String fltno = request.getParameter("fltno");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String fltname = request.getParameter("fltname");
		int fare = Integer.parseInt(request.getParameter("fare"));
		//String airport = request.getParameter("airport");
		String departure_date = request.getParameter("departure_date");
		String arrival_date = request.getParameter("arrival_date");
		String departure_time = request.getParameter("departure_time");
		String arrival_time = request.getParameter("arrival_time");
		
		int totalstops = Integer.parseInt(request.getParameter("totalstops"));
		
		out.println(fltname+" "+fltno+" "+source+" "+destination+" "+departure_date+" "+departure_time+" "+arrival_date+" "+arrival_time+" "+totalstops+" "+fare);
		
		try {
			psmt.setString(1, fltname);
			psmt.setString(2, fltno);
			psmt.setString(3, source);
			psmt.setString(4, destination);
			psmt.setString(5, departure_date);
			psmt.setString(6, departure_time);
			psmt.setString(7,arrival_date );
			psmt.setString(8, arrival_time);
			psmt.setInt(9, totalstops);
			psmt.setInt(10, fare);
			
			psmt.executeUpdate();
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminDivert.jsp");
			rd.include(request, response);
			
		} catch (SQLException e) {
			System.out.println("Inside error of do post of adminaddflight servlet "+e);
		}
		
		
		
		
	}

}
