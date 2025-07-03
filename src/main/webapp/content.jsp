<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Integer studentId = (session != null) ? (Integer) session.getAttribute("student_id") : null;
    if (studentId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CampusCart Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('images/back3.jpg');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        nav {
            background-color: #34495e;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        nav a {
            padding: 15px 20px;
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: background 0.3s;
        }

        nav a:hover {
            background-color: #1abc9c;
        }

        .container {
            background: white;
            margin: auto;
            padding: 40px 30px;
            border-radius: 12px;
            max-width: 400px;
            width: 90%;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            text-align: center;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .btn {
    display: block;
    width: 100%;
    margin: 10px 0;
    padding: 12px;
    background-color: #34495e; /* Mustard */
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-size: 16px;
    transition: 0.3s ease;
}

.btn:hover {
    background-color: #e6b800; /* Darker mustard */
}
        

        .logout {
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }

        .logout a {
            color: red;
            text-decoration: none;
        }

        .logout a:hover {
            text-decoration: underline;
        }

        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 15px 10px;
            margin-top: auto;
            font-size: 14px;
        }

        @media (max-width: 600px) {
            header {
                font-size: 22px;
            }

            nav a {
                padding: 10px;
                font-size: 14px;
            }

            .container {
                padding: 25px 20px;
            }
        }
    </style>
</head>

<body>


<header>The Campus Cart and Care</header>

<nav>
    <a href="student_activities.jsp">Dashboard</a>
    <a href="categories.jsp">Buy Items</a>
    <a href="sell.jsp">Sell</a>
    <a href="complaint.jsp">Complaints</a>
    <a href="student_activities.jsp">Your Activities</a>
</nav>

<div class="container">
    <h1>Welcome to CampusCart</h1>
    <a class="btn" href="sell.jsp">Sell an Item</a>
    <a class="btn" href="categories.jsp">Buy Items</a>
    <a class="btn" href="complaint.jsp">Make a Complaint</a>
    <a class="btn" href="student_activities.jsp">Check Your Activities</a>

    <div class="logout">
        Not you? <a href="ThrHomePage.html">Logout</a>
    </div>
</div>

<footer>
    &copy; 2025 The Campus Cart and Care | Contact: support@campuscart.edu
</footer>

</body>
</html>
