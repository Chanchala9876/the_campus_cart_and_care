<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, jakarta.servlet.http.*, jakarta.servlet.*" %>
<%
    HttpSession sessionObj = request.getSession(false);
    Integer studentId = (sessionObj != null) ? (Integer) sessionObj.getAttribute("student_id") : null;
    if (studentId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String jdbcURL = "jdbc:mysql://localhost:3306/campuscart";
    String dbUser = "root";
    String dbPassword = "chanjhalaA1!";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --bg-light: #fdf6e3;
            --bg-dark: #8d6e63;
            --accent: #ffe082;
            --text-dark: #3e2723;
            --card-bg: #fffaf0;
        }

        body {
            background-color: var(--bg-light);
            font-family: 'Segoe UI', sans-serif;
        }

        header {
            background-color: var(--bg-dark);
            color: white;
            padding: 20px;
            text-align: center;
        }

        nav.navbar {
            background-color: #a1887f;
        }

        nav.navbar .nav-link {
            color: white !important;
            font-weight: 500;
        }

        nav.navbar .nav-link:hover {
            background-color: var(--accent);
            color: var(--text-dark) !important;
        }

        .container {
            margin-top: 30px;
        }

        .section-title {
            margin-top: 40px;
            color: var(--text-dark);
        }

        .card {
            background-color: var(--card-bg);
        }

        footer {
            background-color: brown;
            text-align: center;
            padding: 15px;
            margin-top: 50px;
            color: beige;
        }
    </style>
</head>
<body>

<header>
    <h1>Campus Cart and Care</h1>
</header>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Dashboard</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="ThrHomePage.html">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="ThrHomePage.html">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h2 class="text-center text-dark">Your Activities</h2>

    <!-- Complaints Section -->
    <h4 class="section-title">Your Complaints</h4>
    <div class="list-group mb-4">
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM complaint WHERE student_id = ?");
            ps1.setInt(1, studentId);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
    %>
        <div class="list-group-item mb-2">
            <strong>Complaint:</strong> <%= rs1.getString("complaint_text") %><br>
            <strong>Status:</strong> <%= rs1.getString("status") %><br>
            <small><strong>Submitted:</strong> <%= rs1.getTimestamp("submitted_on") %></small>
        </div>
    <%
            }
            rs1.close(); ps1.close();
    %>
    </div>

    <!-- Products Section -->
    <h4 class="section-title">Your Uploaded Products</h4>
    <div class="row">
    <%
        PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM product WHERE student_id = ?");
        ps2.setInt(1, studentId);
        ResultSet rs2 = ps2.executeQuery();
        while (rs2.next()) {
    %>
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <% if (rs2.getString("image_url") != null) { %>
                    <img src="<%= rs2.getString("image_url") %>" class="card-img-top" alt="Product Image">
                <% } %>
                <div class="card-body">
                    <h5 class="card-title"><%= rs2.getString("title") %></h5>
                    <p class="card-text"><%= rs2.getString("description") %></p>
                    <p><strong>Price:</strong> ₹<%= rs2.getBigDecimal("price") %></p>
                    <p><strong>Status:</strong> <%= rs2.getString("status") %></p>

                    <% if (!"sold".equals(rs2.getString("status"))) { %>
                        <form method="post" action="MarkProductSoldServlet">
                            <input type="hidden" name="product_id" value="<%= rs2.getInt("product_id") %>">
                            <button type="submit" class="btn btn-success mt-2">Mark as Sold</button>
                        </form>
                    <% } else { %>
                        <button class="btn btn-secondary mt-2" disabled>Already Sold</button>
                    <% } %>
                </div>
            </div>
        </div>
    <%
        }
        rs2.close(); ps2.close();
        conn.close();
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        }
    %>
    </div>
</div>

<footer>
    <p>&copy; 2025 Campus Cart and Care. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
