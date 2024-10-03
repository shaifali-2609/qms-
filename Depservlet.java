package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Userdao;
import helper.Connections;
import pojoclass.Department;

/**
 * Servlet implementation class Depservlet
 */
@WebServlet("/Depservlet")
public class Depservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Depservlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		PrintWriter out=response.getWriter();
		try {
		int deptid=Integer.parseInt(request.getParameter("depid"));
		String depname=request.getParameter("depname");
		Department dep=new Department(deptid,depname);
		Userdao dao =new Userdao(Connections.getcon());
		if(dao.indertdept(dep)){
			response.sendRedirect("department.jsp");
		}
		else {
			out.println("error");
			
		}}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
