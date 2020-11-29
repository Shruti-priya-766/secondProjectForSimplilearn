package com.shruti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminlogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement psmt;
	private PrintWriter out;
	private Connection connection;
	
	

	
	public void init() {
		try {
			
			System.out.println("Inside the adminlogin init method");
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "");
			
			String query = "Select * from  adminlogin where admin_user_name = ? and admin_password = ?";
			psmt = connection.prepareStatement(query);
			System.out.println("successfully connected to the database.");

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Inside exception block of init"+e);
		}
		
	}
	
	void processrequestresponse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		String username  = request.getParameter("adminusername");
		String password = request.getParameter("adminpassword");
		
		
		
		
		try {
			psmt.setString(1, username);
			psmt.setString(2, password);
			
			ResultSet rs = psmt.executeQuery();
			System.out.println(username+" "+password);
			if(rs.next()) {
				out = response.getWriter();
				
				out.println("<h1 align=center>");
				out.println("Welcome to Adminlogin panel ");
				out.println("</br>");
				out.println("</h1>");
				
//				
				RequestDispatcher rd = request.getRequestDispatcher("AdminDivert.jsp");
				
				rd.include(request, response);
//				response.setContentType("html/text");
			}
			else {
				out.println("<h4 align = center>You are not an Admin</h4>");
				request.getRequestDispatcher("AdminLogin.jsp").include(request, response);
			}
			
			
		} catch (SQLException e) {
			System.out.println("Inside the Adminlogin.java exception block "+e);
			out.println("<h4 align = center>You are not an Admin</h4>");
			request.getRequestDispatcher("AdminLogin.jsp").include(request, response);
		}
	}
	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processrequestresponse(request, response);
	}

	
	public void destroy() {
		try {
			connection.close();
			psmt.close();
		} catch (SQLException e) {
			System.out.println("failed to close the connection");
		}
	}
}
