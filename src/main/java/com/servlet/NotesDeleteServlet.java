package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.NotesDAO;
import com.DB.DBConnect;

@WebServlet("/NotesDeleteServlet")
public class NotesDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int notesId=Integer.parseInt(request.getParameter("note_id"));
		NotesDAO dao= new NotesDAO(DBConnect.getConnection());
		boolean f= dao.deleteNotes(notesId);
		if (f) {

			System.out.println("Note Deleted");
			HttpSession session=request.getSession();
			session.setAttribute("notes-delete-msg","Your Note is Deleted Successfully...");
			response.sendRedirect("NotesList.jsp");
		} else {
			System.out.println("Note Not Deleted");
			HttpSession session=request.getSession();
			session.setAttribute("err-notes-delete-msg","Your Note is Not Deleted...");
			response.sendRedirect("NotesList.jsp");

		}
		
		
	}

}
