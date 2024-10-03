package Servlets;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Userdao;
import helper.Connections;
import pojoclass.Assigncom;

@WebServlet("/Assignservlet")
public class Assignservlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;

	    public Assignservlet () {
	        super();
	    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       int  compl = Integer.parseInt(request.getParameter("complainId"));
      int empl = Integer.parseInt(request.getParameter("empId"));

      Assigncom com= new Assigncom(empl,compl);
        

        Userdao dao = new Userdao(Connections.getcon());
        if(dao.assign(com)){
        	response.sendRedirect("assighcompain.jsp");
        }
        else {
        	response.sendRedirect("assighcompain.jsp");
        }
       
        
      
}}