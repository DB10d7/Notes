package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DB.DBConnect;


@WebServlet("/deleteUserServlet")
public class deleteUserServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("delete");
		int id = Integer.parseInt(request.getParameter("id"));
		UserDAO dao= new UserDAO(DBConnect.getConnection());
		boolean f= dao.deleteUser(id);

		if (true) {

			HttpSession session = request.getSession();
			session.setAttribute("dlt-msg", "User Account Deleted");
			response.sendRedirect("login.jsp");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("err-msg", "Registration Unsuccessfull");
			response.sendRedirect("register.jsp");

		}

	}

}
