<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*, java.util.*, jakarta.servlet.http.*, jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<%
    Integer studentId = (session != null) ? (Integer) session.getAttribute("student_id") : null;

    if (studentId == null) {
        response.sendRedirect("studentlogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<head>
    <title>Sell Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
padding: 20px;
            background:url('background.jpg');
              background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    background-attachment: fixed;
    color: #2c3e50;
        }
         h2{
        align-items:center;
        margin-top:35px;
        }
        
        .header {

        text-align: center;

        color: var(--dark-color);

        background-color: rgba(255, 255, 255, 0.9);

        padding: 20px 0;

        margin-bottom: 20px;

        border-bottom: 3px solid var(--primary-color);

      }

      

      .navbar-custom {

        background-color: #2c3e50;

        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);

      }

      

      .navbar-custom .navbar-nav .nav-link {

        color: white;

        font-weight: 500;

        padding: 8px 15px;

        margin: 0 5px;

        border-radius: 4px;

        transition: all 0.3s ease;

      }
      .search-btn{
      color:white;
       background:linear-gradient(135deg, #2eb4cc, #276dae);
      }

      

      .navbar-custom .navbar-nav .nav-link:hover,

      .navbar-custom .navbar-nav .nav-link.active {

        background-color: var(--secondary-color);

        color: white;

      }

        

        .grid {
            display: flex;
            gap: 30px;
            flex-wrap: wrap;
            justify-content: center;
            padding:40px auto;
        }
        .submit{
        align-items:center;
        text-align:center;
         margin-left:200px;
         background:linear-gradient(135deg, #2eb4cc, #276dae);
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
          background:rgba(255, 255, 255,0.4);
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            align-content:center;
            
           
        }

        h2 {
            text-align: center;
            color: #2c3e50;;
            margin-bottom: 25px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 5px;
            color: #444;
        }

        input[type="text"],
        input[type="number"],
        select,
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .status-message {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
            color: green;
        }

        .status-message.error {
            color: red;
        }
    </style>
</head>

<body>
<header class="header">

        <h1>THE CAMPUS CART AND CARE</h1>

      </header>

      

      <nav class="navbar navbar-expand-lg navbar-custom">

        <div class="container-fluid">

          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-check-fill" viewBox="0 0 16 16" style="margin-right:10px; color:white;">

            <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0m7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m-1.646-7.646-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L8 8.293l2.646-2.647a.5.5 0 0 1 .708.708"/>

          </svg>

          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">

            <span class="navbar-toggler-icon"></span>

          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

              <li class="nav-item">

                <a class="nav-link active" aria-current="page" href="ThrHomePage.html">Home</a>

              </li>

              <li class="nav-item">

                <a class="nav-link" href="about.html">About</a>

              </li>

              

             
            

              <li class="nav-item">

                <a class="nav-link" href="contact.html">Contact</a>

              </li>
              <li class="nav-item">

                <a class="nav-link" href="student_activities.jsp">Your Activity</a>

              </li>
              

            </ul>

            <form class="d-flex" role="search">

              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">

              <button class="btn search-btn" type="submit">Search</button>

            </form>

          </div>

        </div>

      </nav>

    <div class="container">
        <h2>Post Your AD</h2>

        <% if ("success".equals(request.getParameter("status"))) { %>
            <div class="status-message">Product submitted successfully!</div>
        <% } else if ("error".equals(request.getParameter("status"))) { %>
            <div class="status-message error">There was an error posting your product. Try again.</div>
        <% } %>

       <form action="<%= request.getContextPath() %>/SellProductServlet" method="post" enctype="multipart/form-data">
       
            <label>Product Title:</label>
            <input type="text" name="title" required>

            <label>Description:</label>
            <textarea name="description" required></textarea>

            <label>Price:</label>
            <input type="number" name="price" step="0.01" required>

            <label>Category:</label>
            <select name="category_id" required>
                <%
                
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/campuscart", "root", "chanjhalaA1!");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT category_id, cname FROM category");
                    while (rs.next()) {
                %>
                    <option value="<%= rs.getInt("category_id") %>"><%= rs.getString("cname") %></option>
                <%
                    }
                    rs.close(); stmt.close(); conn.close();
                %>
            </select>

            <label>Image:</label>
            <input type="file" name="image" accept="image/*" required>

            <input type="submit" value="Submit Product" class="submit">
        </form>
    </div>
</body>

</html>
