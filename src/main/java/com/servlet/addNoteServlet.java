package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.NotesDAO;
import com.DAO.UserDAO;
import com.DB.DBConnect;
import com.entites.Notes;
import com.entites.User;

@WebServlet("/addNoteServlet")
public class addNoteServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId=Integer.parseInt(request.getParameter("userId"));
		String title=request.getParameter("title");
		String body=request.getParameter("body");
		String author=request.getParameter("author");
		
		
		
		NotesDAO dao= new NotesDAO(DBConnect.getConnection()); 
		boolean f= dao.addNotes(title,body,author,userId);
		
		if (f) {

			System.out.println("Note Created");
			HttpSession session=request.getSession();
			session.setAttribute("notes-add-msg","Your Note Added Successfully...");
			response.sendRedirect("NotesList.jsp");
		} else {
			System.out.println("Note Not Created");
			HttpSession session=request.getSession();
			session.setAttribute("err-notes-add-msg","Your Note is Not Added...Its too Long");
			response.sendRedirect("NotesList.jsp");

		}
	}

}
