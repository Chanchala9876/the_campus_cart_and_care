<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <title>Student Signup - Campus Cart</title>
  <style>
    * {
      box-sizing: border-box;
    }
body {
  margin: 0;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-image: url('backg.jpg');
  background-attachment: fixed; /* Keeps the background fixed while content scrolls */
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  min-height: 100vh;
}
body::before {
  content: '';
  position: fixed;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  background: rgba(0, 0, 0, 0.4); /* adjust transparency */
  z-index: -1;
}


    /* Navbar */
    
    /* Centered container */
    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 3rem 1rem;
    }

    .signup-box {
      background-color: rgba(255, 255, 255, 0.95);
      padding: 2rem;
      border-radius: 16px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
      max-width: 400px;
      width: 100%;
    }

    h2 {
      margin-bottom: 1.5rem;
      text-align: center;
      color: #333;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    select {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border-radius: 8px;
      border: 1px solid #ccc;
      font-size: 1rem;
    }

    button {
      width: 100%;
      padding: 12px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
      margin-top: 1rem;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #0056b3;
    }

    .already-registered {
      display: block;
      text-align: center;
      margin-top: 1.5rem;
      font-size: 0.9rem;
      color: #007bff;
      text-decoration: none;
    }

    .already-registered:hover {
      text-decoration: underline;
    }
     footer {
      background-color: #333;
      color: white;
      text-align: center;
      padding: 15px 0;
      font-size: 14px;
    }

    @media (max-width: 480px) {
      .signup-box {
        padding: 1.5rem;
      }
    }
  </style>
</head>
<body>

  <div class="Header">
    Campus Cart
  </div>
   <header class="header">
        <h1 style="text-align:center; color:beige">THE CAMPUS CART AND CARE</h1>
      </header>
      
      <nav class="navbar navbar-expand-lg navbar-custom" style="background-color:brown;">
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
                <a class="nav-link active" style="color:beige;" aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" style="color:beige;" href="about.html">About</a>
              </li>
              
              <li class="nav-item">
                <a class="nav-link" style="color:beige;" href="SignupServlet">Signup</a>
                
              </li>
              <li class="nav-item">
                <a class="nav-link" style="color:beige;" href="login.jsp">login</a>
                
              </li>
              <li class="nav-item">
                <a class="nav-link" style="color:beige;" href="contact.html">Contact</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" style="color:beige;" href="content.jsp">Content</a>
              </li>
            </ul>
            
            <li>
            <a class="btn btn-primary" style="background-color:beige; color:brown;" href="caretakerlogin.jsp" role="button">Caretaker Login</a></li>
          
          </div>
        </div>
      </nav>
      

  <div class="container">
    <div class="signup-box">
      <h2>Student Signup</h2>
      <form action="SignupServlet" method="post" style="background-color:transparent;">
        <input type="text" name="name" placeholder="Name" required />
        <input type="email" name="email" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />

        <%
          List<String[]> hostelList = (List<String[]>) request.getAttribute("hostels");
          if (hostelList == null) {
              System.out.println("Hostel list is NULL in JSP");
          } else {
              System.out.println("Number of hostels received: " + hostelList.size());
          }
        %>

        <select  name="hostel" required>
          <option value="">-- Select Hostel --</option>
          <%
              if (hostelList != null && !hostelList.isEmpty()) {
                  for (String[] hostel : hostelList) {
          %>
              <option value="<%= hostel[0] %>"><%= hostel[1] %></option>
          <%
                  }
              } else {
          %>
              <option value="" disabled>No hostels available</option>
          <%
              }
          %>
        </select>

        <button  style="background-color:brown;" type="submit">Register</button>
      </form>
      <a href="login.jsp" style="color:brown;" class="already-registered">Already registered?</a>
    </div>
  </div>
<footer >
    <p>&copy; 2025 CampusCart . All rights reserved.</p>
  </footer>
</body>
</html>
