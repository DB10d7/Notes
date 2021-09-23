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

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		UserDAO dao= new UserDAO(DBConnect.getConnection());
		User user= dao.getLogin(email, password);
		
		if(user!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("user-obj",user);
			response.sendRedirect("NotesList.jsp");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("err-msg","Login Unsuccessfull");
			response.sendRedirect("login.jsp");
		}
		
	}

}
