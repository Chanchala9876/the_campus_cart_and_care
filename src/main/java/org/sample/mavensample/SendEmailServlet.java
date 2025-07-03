package org.sample.mavensample;



import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

@WebServlet("/SendEmailServlet")
public class SendEmailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("student_id"));
        String productTitle = request.getParameter("title");
        String sellerEmail = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/campuscart", "root", "chanjhalaA1!");
            PreparedStatement ps = conn.prepareStatement("SELECT email FROM student WHERE student_id = ?");
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                sellerEmail = rs.getString("email");
            }

            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (!sellerEmail.isEmpty()) {
            final String fromEmail = "chanchalakumari1950@gmail.com"; // your Gmail
            final String password = "atwerbujgoupidtu"; // use app password for Gmail

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(fromEmail));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sellerEmail));
                message.setSubject("Interest in your product: " + productTitle);
                message.setText("Hello, someone is interested in your product: " + productTitle + ". Please contact them for more info.");

                Transport.send(message);
                response.sendRedirect("student_activities.jsp?status=sent");
            } catch (MessagingException e) {
                e.printStackTrace();
                response.sendRedirect("student_activities.jsp?status=failed");
            }
        } else {
            response.sendRedirect("student_activities.jsp?status=notfound");
        }
    }
}
