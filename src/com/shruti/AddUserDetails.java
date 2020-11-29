package com.shruti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.mysql.cj.Session;


@WebServlet("/adduser")
public class AddUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private PreparedStatement psmt;
	
	
	
	
	public void init() {
		try {
			
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "");
			
//			username, password
			String query = "Insert into userlogin (username, password, first_name, last_name, email, phone )values (?,?,?,?,?,?)";
			psmt = connection.prepareStatement(query);

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Inside exception block of init"+e);
		}
		
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				
		System.out.println("You are inside add user servlet get method");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("You are inside add user servlet post method");
		
		String username = request.getParameter("username");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("name", username);
		
		
		String email = request.getParameter("email");
		String mobileno = request.getParameter("mobileno");
		String password = request.getParameter("password");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		PrintWriter out = response.getWriter();
		
		
		try {
			psmt.setString(1, username);
			psmt.setString(2, password);
			psmt.setString(3, fname);
			psmt.setString(4, lname);
			psmt.setString(5, email);
			psmt.setString(6, mobileno);
			System.out.println(username+" "+password);
			psmt.executeUpdate();
			
			
			out.println("You can login with the registered details here :");
			request.getRequestDispatcher("login.jsp").include(request, response);
		} catch (SQLException e) {
			out.println("This Username is already used ");
			out.println(e);
		}
		
		
		
		

		
	}

}
