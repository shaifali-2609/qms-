package Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Userdao;
import helper.Connections;
import pojoclass.Reply;

/**
 * Servlet implementation class Replyservlet
 */
@WebServlet("/Replyservlet")
public class Replyservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Replyservlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGet(request, response);
	    try {
	        String date = request.getParameter("rdate");
	        int comid = Integer.parseInt(request.getParameter("complainId"));
	        int emid = Integer.parseInt(request.getParameter("empId"));
	        String cusemail = request.getParameter("cemail");
	        String reply = request.getParameter("rmsg");

	        // Debugging statements
	        System.out.println("Complain ID: " + comid);
	        System.out.println("Employee ID: " + emid);
	        System.out.println("Customer Email: " + cusemail);
	        System.out.println("Reply Message: " + reply);

	        SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
	        Date date1 = s.parse(date);
	        java.sql.Date sqlDate = new java.sql.Date(date1.getTime());

	        Reply re = new Reply(comid, sqlDate, cusemail, emid, reply);

	        Userdao dao = new Userdao(Connections.getcon());
	        if (dao.insertreply(re)) {
	            response.sendRedirect("reply.jsp");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}