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
import pojoclass.Employee;

/**
 * Servlet implementation class Employeeservlet
 */
@WebServlet("/Employeeservlet")
public class Employeeservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Employeeservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		PrintWriter out =response.getWriter();
		try{String name=request.getParameter("ename");
		String email=request.getParameter("eemail");
		String pass=request.getParameter("epass");
		int id=Integer.parseInt(request.getParameter("id"));
		String role=request.getParameter("role");
		Employee emp=new Employee(name,email,pass,id,role);
		Userdao dao=new Userdao(Connections.getcon());
		if(dao.insertemp(emp)) {
			response.sendRedirect("addEmployeeManagmemt.jsp");
		}	
		else {
			out.println("error");
			
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		

}}
