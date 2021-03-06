package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DB.DBConnect;
import com.entites.User;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		User user= new User();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		
		UserDAO dao= new UserDAO(DBConnect.getConnection()); 
		boolean f= dao.userRegister(user);
		
		if(f) {
			
			HttpSession session = request.getSession();
			session.setAttribute("reg-msg","Registration Successfull");
			response.sendRedirect("login.jsp");
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("err-msg","Registration Unsuccessfull");
			response.sendRedirect("login.jsp");
			
		}
	}

}
