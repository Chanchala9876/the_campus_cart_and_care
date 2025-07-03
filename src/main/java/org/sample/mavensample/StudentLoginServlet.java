package org.sample.mavensample;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/StudentLoginServlet")
public class StudentLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/campuscart", "root", "chanjhalaA1!");
                 PreparedStatement ps = conn.prepareStatement(
                         "SELECT student_id FROM student WHERE email = ? AND password = ?")) {

                ps.setString(1, email);
                ps.setString(2, password);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    int studentId = rs.getInt("student_id");

                    HttpSession session = request.getSession();
                    session.setAttribute("student_id", studentId);

                    response.sendRedirect("content.jsp");
                } else {
                    request.setAttribute("error", "Invalid email or password.");
                    //RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
                   // dispatcher.forward(request, response);
                   // response.sendRedirect("login.jsp");
                    response.sendRedirect("login.jsp?message=Wrong email or password");
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong. Please try again.");
            request.getRequestDispatcher("studentlogin.jsp").forward(request, response);
        }
    }
}
