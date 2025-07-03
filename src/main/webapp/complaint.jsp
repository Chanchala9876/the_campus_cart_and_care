<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%
    HttpSession sessionObj = request.getSession(false);
    Integer studentId = (sessionObj != null) ? (Integer) sessionObj.getAttribute("student_id") : null;
    if (studentId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<String[]> hostels = new java.util.ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/campuscart", "root", "chanjhalaA1!");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT hostel_id, name FROM hostel");
        while (rs.next()) {
            hostels.add(new String[]{rs.getString("hostel_id"), rs.getString("name")});
        }
        rs.close(); stmt.close(); conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submit Complaint - Campus Cart & Care</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/back1.jpg');
            background-attachment: fixed;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #a1887f;
            color: #fff;
            padding: 15px 0;
            text-align: center;
            font-size: 28px;
            font-weight: 600;
            letter-spacing: 1px;
        }

        nav {
            background-color: #d7ccc8;
            display: flex;
            justify-content: center;
            gap: 40px;
            padding: 12px 0;
            font-weight: 500;
        }

        nav a {
            color: #4e342e;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: #3e2723;
            text-decoration: underline;
        }

        .form-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 60px 15px;
            min-height: 80vh;
        }

        .form-container {
            background-color: #fffaf0;
            padding: 35px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            width: 420px;
            max-width: 95%;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
            color: #5d4037;
        }

        label {
            font-weight: 500;
            color: #4e342e;
        }

        select, textarea, button {
            width: 100%;
            padding: 12px 14px;
            margin-top: 8px;
            margin-bottom: 20px;
            border: 1px solid #bbb;
            border-radius: 8px;
            font-size: 15px;
            background-color: #f5f5dc;
            transition: all 0.2s ease-in-out;
        }

        select:focus, textarea:focus {
            outline: none;
            border-color: #a1887f;
            box-shadow: 0 0 5px rgba(161, 136, 127, 0.4);
        }

        textarea {
            resize: none;
        }

        button {
            background-color: #8d6e63;
            color: white;
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #6d4c41;
        }

        footer {
            background-color: #a1887f;
            color: white;
            text-align: center;
            padding: 12px 0;
            font-size: 14px;
        }

        @media (max-width: 600px) {
            nav {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <header>Campus Cart & Care</header>
    <nav>
        <a href="ThrHomePage.html">Home</a>
        
        <a href="student_activities.jsp">My Products</a>
        <a href="about.html">About</a>
        <a href="ThrHomePage.html">Logout</a>
        
    </nav>

    <div class="form-wrapper">
        <div class="form-container">
            <h2>Submit a Complaint</h2>
            <form action="ComplaintServlet" method="post">
                <label for="hostel">Select Hostel:</label>
                <select name="hostel_id" required>
                    <option value="">-- Select Hostel --</option>
                    <% for (String[] hostel : hostels) { %>
                        <option value="<%= hostel[0] %>"><%= hostel[1] %></option>
                    <% } %>
                </select>

                <label for="complaint">Your Complaint:</label>
                <textarea name="complaint_text" rows="5" placeholder="Mention your room no.(if any) and describe your issue clearly..." required></textarea>

                <button type="submit">Submit Complaint</button>
            </form>
        </div>
    </div>

    <footer>
        &copy; 2025 Campus Cart & Care. All rights reserved.
    </footer>
</body>
</html>
