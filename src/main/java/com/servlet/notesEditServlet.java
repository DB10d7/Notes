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

@WebServlet("/notesEditServlet")
public class notesEditServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			int notesId=Integer.parseInt(request.getParameter("notesId"));
			String title=request.getParameter("title");
			String body=request.getParameter("body");
			
			NotesDAO dao= new NotesDAO(DBConnect.getConnection()); 
			boolean f= dao.notesEdit(notesId,title,body);
			
			if (f) {

				System.out.println("Note Created");
				HttpSession session=request.getSession();
				session.setAttribute("notes-update-msg","Your Note Edited Successfully...");
				response.sendRedirect("NotesList.jsp");
			} else {
				System.out.println("Note Not Created");
				HttpSession session=request.getSession();
				session.setAttribute("err-notes-add-msg","Your Note is Not Updated...Its too Long");
				response.sendRedirect("NotesList.jsp");

			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
