<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Browse by Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
             background:url('Background3.jpg');
              background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    background-attachment: fixed;
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

        .card {
  width: 250px;
    height: 50vh;
    padding: 20px;

    display: flex;
    flex-direction: column;
    justify-content: space-between;

    text-align: center;
    border-radius: 15px;
    box-shadow: 0 0 10px rgba(0,0,0,0.15);
    transition: transform 0.2s ease-in-out;
    text-decoration: none;
    color: #333;
    margin-top: 70px;
    background-size: cover;
    background-position: center;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }

        .card h3 {
            margin-top: 0px;
            color:white;
        }
        .link{
            
            
            color:white;
            text-decoration: none;
            display: inline-block;
    margin-top: 10px; /* Increased space from above */
    color: black;
    
    text-decoration: none;
  
    font-size: 0.8rem;
    padding: 10px 30px ;
    border-radius: 30px;
    background-color: #D2B48C;
    transition: background-color 0.3s ease;
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

                <a class="nav-link" href="#">About</a>

              </li>

              

             
            

              <li class="nav-item">

                <a class="nav-link" href="#">Contact</a>

              </li>

            </ul>

            <form class="d-flex" role="search">

              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">

              <button class="btn search-btn" type="submit">Search</button>

            </form>

          </div>

        </div>

      </nav>

      
    <h2>Select a Category</h2>
    <div class="grid">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/campuscart", "root", "chanjhalaA1!");

                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM category");

                while (rs.next()) {
                    int id = rs.getInt("category_id");
                    String cname = rs.getString("cname");
                    String imageUrl = rs.getString("image");
        %>
            <div class="card"  style="background-image: url('<%= imageUrl %>'); background-size: cover; background-position: center;">
                <h3><%= cname %></h3>
                <a class="link" href="categoryProducts.jsp?category_id=<%=id%>">View all <%= cname %> products </a>
                
            </div>
        <%
                }
                rs.close(); stmt.close(); conn.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </div>
</body>
</html>
