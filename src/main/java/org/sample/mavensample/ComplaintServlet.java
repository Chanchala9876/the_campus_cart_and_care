package org.sample.mavensample;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.io.IOException;
import java.sql.*;
import java.util.Properties;

@WebServlet("/ComplaintServlet")
public class ComplaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer studentId = (session != null) ? (Integer) session.getAttribute("student_id") : null;

        if (studentId == null) {
            response.sendRedirect("studentlogin.jsp");
            return;
        }

        String complaintText = request.getParameter("complaint_text");
        int hostelId = Integer.parseInt(request.getParameter("hostel_id"));
        String caretakerEmail = "";

        // DB connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/campuscart";
        String dbUser = "root";
        String dbPassword = "chanjhalaA1!";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Fetch caretaker email from hostel table
            String getEmailSql = "SELECT caretaker_email FROM hostel WHERE hostel_id = ?";
            PreparedStatement emailStmt = conn.prepareStatement(getEmailSql);
            emailStmt.setInt(1, hostelId);
            ResultSet rs = emailStmt.executeQuery();

            if (rs.next()) {
                caretakerEmail = rs.getString("caretaker_email");
            }

            // Insert complaint into complaint table
            String insertSql = "INSERT INTO complaint (student_id, hostel_id, complaint_text) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(insertSql);
            stmt.setInt(1, studentId);
            stmt.setInt(2, hostelId);
            stmt.setString(3, complaintText);
            stmt.executeUpdate();

            // Send email to caretaker
            sendEmail(caretakerEmail, "New Complaint Submitted", complaintText);

            conn.close();
            response.sendRedirect("student_activities.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private void sendEmail(String toEmail, String subject, String body) {
        final String fromEmail = "chanchalakumari1950@gmail.com"; // your Gmail
        final String password = "atwe rbuj goup idtu"; // App password (not Gmail password)

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session mailSession = Session.getInstance(props,
            new jakarta.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

        try {
            Message message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
