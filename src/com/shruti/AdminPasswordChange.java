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


@WebServlet("/AdminPasswordChange")
public class AdminPasswordChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement psmt;
       
	public void init() {
		try {
			
			System.out.println("Inside the userlogin init method");
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "");
			
			String query = "Update adminlogin set admin_password = ? where admin_user_name = ?";
			psmt = connection.prepareStatement(query);

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Inside exception block of init"+e);
		}
		
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String adminusername = request.getParameter("adminusername");
		String adminnewpassword = request.getParameter("changedpassword");
		
		try {
			psmt.setNString(1, adminnewpassword);
			psmt.setNString(2, adminusername);
			
			psmt.executeUpdate();
			
			response.getWriter().println("Password successfully changed");
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminDivert.jsp");
			rd.include(request, response);
			
		} catch (SQLException e) {
			System.out.println("Inside the exceoptin while changein password servlet "+e);
		}
		
		
		
	}

}
