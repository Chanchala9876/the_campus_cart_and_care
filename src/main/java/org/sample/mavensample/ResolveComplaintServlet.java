package org.sample.mavensample;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
@WebServlet("/ResolveComplaintServlet")
public class ResolveComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int complaintId = Integer.parseInt(request.getParameter("complaint_id"));
        String jdbcURL = "jdbc:mysql://localhost:3306/campuscart";
        String dbUser = "root";
        String dbPassword = "chanjhalaA1!";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String sql = "UPDATE complaint SET status = 'resolved', resolved_on = NOW() WHERE complaint_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, complaintId);
            stmt.executeUpdate();

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to dashboard
        response.sendRedirect("caretaker_dashboard.jsp");
    }
}
