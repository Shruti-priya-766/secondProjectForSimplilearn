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

@WebServlet("/loginUser")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement psmt;
	private Connection connection;
	private PrintWriter out;
       
	
	public void init() {
		try {
			
			System.out.println("Inside the userlogin init method");
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "");
			
			String query = "Select * from  userlogin where username = ? and password = ?";
			psmt = connection.prepareStatement(query);

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Inside exception block of init"+e);
		}
		
	}
	
	void processrequestresponse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		String username  = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username+" "+password);
		
		try {
			psmt.setString(1, username);
			psmt.setString(2, password);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				request.getSession().setAttribute("username", username);
				out = response.getWriter();
				
				out.println("<h1 align=center>");
				out.println("Welcome "+ rs.getString("first_name")+" " +rs.getString("last_name") );
				out.println("</h1>");
				
//				
				RequestDispatcher rd = request.getRequestDispatcher("MakePayment.jsp");
				
				rd.include(request, response);
//				response.setContentType("html/text");
				System.out.println("Creted http session");
			}
			else {
				out.println("<h4 align = center>Please Enter Valid Username and Password</h4>");
				request.getRequestDispatcher("login.jsp").include(request, response);
			}
			
			
		} catch (SQLException e) {
			System.out.println("Inside the userlogin.java exception block "+e);
		}
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	response.getWriter().println("<h3>Inside User login do get method</h3>");
	
	processrequestresponse(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("html/text");
//		response.getWriter().println("<h6></h6>");
		
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
