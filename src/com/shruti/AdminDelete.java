package com.shruti;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admindelete")
public class AdminDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement psmt;
       
	
	
	public void init() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "");
			psmt= connection.prepareStatement( "Delete from flight_info where flight_id =  ?");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Inside exception of Admindelete Servlet init method"+e);
		
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		System.out.println("Inside admindelete Servlet Doget method");
		
		String param = request.getParameter("flightno");
		response.getWriter().println(param);
		
		try {
			psmt.setString(1, param);
			
			psmt.executeUpdate();
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminViewFlights.jsp");
			rd.include(request, response);
			
		} catch (SQLException e) {
			System.out.println("inside do get psmt setstring exception block "+e);
		}
		
		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside admindelete dopost");
	}

}
