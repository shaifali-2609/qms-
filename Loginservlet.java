package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Userdao;
import helper.Connections;
import helper.Messege;
import pojoclass.Admin;
import pojoclass.Customer;
import pojoclass.Employee;

@WebServlet("/Loginservlet")
public class Loginservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Loginservlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("pass");
            String role = request.getParameter("role");
            System.out.println(email);
            System.out.println(role);
            
            Userdao dao = new Userdao(Connections.getcon());
            Object user = dao.validateUser(email, password, role);
            System.out.println(email);
            System.out.println(role);
            System.out.println(user);
            
            
            
            if (user != null) {
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("role", role);
                System.out.println(email);
                System.out.println(role);
                

                switch (role) {
                    case "admin":
                        response.sendRedirect("AdminDashboard.jsp");
                        break;
                    case "employee":
                        response.sendRedirect("employeeDashboard.jsp");
                        break;
                    case "customer":
                        response.sendRedirect("customerDashborad.jsp");
                        break;
                    case "manager":
                        response.sendRedirect("managerDashboard.jsp");
                        break;
                    case "hr":
                    	System.out.println(email);
                        System.out.println(role);
                        
                        response.sendRedirect("hrdashboard.jsp");
                        break;
                    default:
                        Messege msg = new Messege("Invalid role!", "success", "alert-danger");
                        request.getSession().setAttribute("msg", msg);
                        response.sendRedirect("login.jsp");
                        break;
                }
            } else {
                Messege msg = new Messege("Invalid email or password!", "success", "alert-danger");
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            Messege msg = new Messege("An error occurred. Please try again later.", "success", "alert-danger");
            request.getSession().setAttribute("msg", msg);
            response.sendRedirect("login.jsp");
        }
    }
}
