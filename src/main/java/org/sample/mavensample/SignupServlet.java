package org.sample.mavensample;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("SignupServlet GET request received");

        List<String[]> hostels = fetchHostelsFromDB();
        request.setAttribute("hostels", hostels);

        System.out.println("Number of hostels fetched: " + 
            (hostels != null ? hostels.size() : 0));

        // Use absolute path to WEB-INF JSP
        RequestDispatcher dispatcher = 
            request.getRequestDispatcher("/studentsignup.jsp");
        dispatcher.forward(request, response);
    }
    private List<String[]> fetchHostelsFromDB() {
        List<String[]> hostels = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        System.out.println("Attempting to connect to database...");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/campuscart", "root", "chanjhalaA1!");
            stmt = conn.createStatement();

            rs = stmt.executeQuery("SELECT hostel_id, name FROM hostel WHERE type = 'hostel'");
            System.out.println("Database connection successful!");

            while (rs.next()) {
                String id = rs.getString("hostel_id");
                String name = rs.getString("name");
                System.out.println("Found hostel: " + id + " - " + name);
                hostels.add(new String[]{id, name});
            }
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("General error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }

        return hostels;
    }

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String hostelIdStr = request.getParameter("hostel");

        int hostelId = Integer.parseInt(hostelIdStr);

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/campuscart", "root", "chanjhalaA1!");

            // Insert student data
            String sql = "INSERT INTO student (name, email, password, hostel_id) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, password);  // Hashing recommended in real apps
            stmt.setInt(4, hostelId);

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                // Get the generated student_id
                rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    int studentId = rs.getInt(1);

                    // Store in session
                    request.getSession().setAttribute("student_id", studentId);

                    // Redirect to home page
                    response.sendRedirect("content.jsp");
                    return;
                }
            }

            // If failed, redirect back or show error
            response.sendRedirect("login.jsp?error=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("studentsignup.jsp?error=2");
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }

        
        
    }
}
