package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Userdao;
import helper.Connections;
import pojoclass.Admin;
import pojoclass.Adminmsg;

/**
 * Servlet implementation class Adminservlet
 */
@WebServlet("/Adminservlet")
public class Adminservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Adminservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String messege= request.getParameter("msg");
		String role=request.getParameter("emprole");
		System.out.println("msg");
		System.out.println("role");
		
	Adminmsg m=new Adminmsg(messege,role);
	Userdao dao=new Userdao(Connections.getcon());
	if(dao.adminmsg(m)) {
		response.sendRedirect("adminmsg.jsp");
	}
		
		
	}

}
