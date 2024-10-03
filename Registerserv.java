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
import pojoclass.Customer;

/**
 * Servlet implementation class Registerserv
 */
@WebServlet("/Registerserv")
public class Registerserv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registerserv() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
	
		 //request.getParameterMap().forEach((key, value) -> System.out.println(key + " = " + String.join(", ", value)));
		 String check = request.getParameter("ccheck");
		 //   if (check == null) {
		    	System.out.println("ccheck: " + request.getParameter("ccheck"));
		//    	out.println("agree terms and condition");
		   // } else {
		        String email = request.getParameter("cemail");
		        String password = request.getParameter("cpass");
		        String mobile = request.getParameter("cmob");
		        String fullname = request.getParameter("cname");
		        String status = request.getParameter("cstatus");
		        Customer cust = new Customer(email, password, mobile, fullname, status);
		        Userdao dao = new Userdao(Connections.getcon());

		        if (dao.savecustomer(cust)) {
		            out.println("Registration successful");
		           response.sendRedirect("login.jsp");
		        } else {
		            out.print("Error");
		        }
		    }
		   
		    	
		    
		    }
		//}  
	
	

	
