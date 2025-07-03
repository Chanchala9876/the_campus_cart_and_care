package org.sample.mavensample;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class CaretakerLoginServlet
 */
@WebServlet("/CaretakerLoginServlet")
public class CaretakerLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String jdbcURL = "jdbc:mysql://localhost:3306/campuscart";
        String dbUser = "root";
        String dbPassword = "chanjhalaA1!";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String sql = "SELECT hostel_id FROM hostel WHERE caretaker_email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int hostelId = rs.getInt("hostel_id");
                HttpSession session = request.getSession();
                session.setAttribute("hostel_id", hostelId);
                response.sendRedirect("caretaker_dashboard.jsp");
            } else {
                response.getWriter().println("Invalid credentials");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
