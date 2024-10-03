package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Userdao;
import helper.Connections;
import helper.Messege;
import pojoclass.Complain;

@WebServlet("/Customerservlet")
public class Customerservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Customerservlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String dateStr = request.getParameter("date");
            String desc = request.getParameter("desc");
String email=request.getParameter("email");
            
            if (desc == null || desc.trim().isEmpty()||email==null) {
                return;
            }

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = formatter.parse(dateStr);
            java.sql.Date sqlDate = new java.sql.Date(date1.getTime());

            Complain com = new Complain(desc, sqlDate,email); 
            Userdao dao = new Userdao(Connections.getcon());

            
            int complaintId = dao.insertDataAndGetId(com);

            if (complaintId > 0) {
                Messege ms = new Messege("Complain successfully done. Your complaint ID is " + complaintId, "success", "alert-success");
                request.getSession().setAttribute("ms", ms);
                response.sendRedirect("complain.jsp");
            } else {
                out.print("error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("error");
        }
    }
}
