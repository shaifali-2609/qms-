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
import helper.Messege;
import pojoclass.Feedback;

@WebServlet("/feedbackservlet")
public class feedbackservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public feedbackservlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String date = request.getParameter("cufd");
            String email = request.getParameter("cuemail");
            String status = request.getParameter("custatus");
            int deptid = Integer.parseInt(request.getParameter("id"));
            String feddes = request.getParameter("desc");

           // if (date == null || email == null || status == null || deptid == 0 || feddes == null) {
          //      throw new IllegalArgumentException("Missing required parameters");
           // }

            SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = s.parse(date);
            java.sql.Date sqldate = new java.sql.Date(date1.getTime());

            Feedback feed = new Feedback(sqldate,email,status,deptid,feddes);
            System.out.println(feed);

            Userdao dao = new Userdao(Connections.getcon());
            if (dao.insertfeed(feed)) {
                System.out.println("Feedback inserted successfully.");
                response.sendRedirect("review.jsp");
            } else {
                System.out.println("Feedback insertion failed.");
                response.getWriter().write("Feedback insertion failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

 
}