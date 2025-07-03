package org.sample.mavensample;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.*;

@WebServlet("/SellProductServlet")
@MultipartConfig
public class SellProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("student_id") == null) {
            response.sendRedirect("studentlogin.jsp");
            return;
        }

        int studentId = (int) session.getAttribute("student_id");

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int categoryId = Integer.parseInt(request.getParameter("category_id"));

        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Save the image in a folder under your webapp (e.g., /uploads/)
        String uploadPath = getServletContext().getRealPath("/uploads");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        String imagePathOnDisk = uploadPath + File.separator + fileName;
        filePart.write(imagePathOnDisk);

        // Path to store in DB (relative)
        String imageUrl = "uploads/" + fileName;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/campuscart", "root", "chanjhalaA1!");

            String sql = "INSERT INTO product (title, description, price, image_url, category_id, student_id, status) " +
                         "VALUES (?, ?, ?, ?, ?, ?, 'available')";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setString(4, imageUrl);
            ps.setInt(5, categoryId);
            ps.setInt(6, studentId);

            ps.executeUpdate();
            conn.close();

            response.sendRedirect("sell.jsp?status=success");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("sell.jsp?status=error");
        }
    }
}
