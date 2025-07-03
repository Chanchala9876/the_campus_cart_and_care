<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Caretaker Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: url('backgr.jpg') no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      position: relative;
    }

    body::before {
      content: '';
      position: fixed;
      top: 0;
      left: 0;
      height: 100%;
      width: 100%;
      background: rgba(0, 0, 0, 0.4);
      z-index: -1;
    }

    .header-title {
      text-align: center;
      color: beige;
      padding: 20px 0;
      font-size: 32px;
      font-weight: 600;
    }

    .login-container {
      background: white;
      border-radius: 15px;
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
      padding: 40px;
      text-align: center;
      animation: fadeIn 0.8s ease-in-out;
      margin-top: 30px;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    h2 {
      color: #4a6fa5;
      margin-bottom: 30px;
      font-weight: 600;
    }

    .input-group {
      margin-bottom: 20px;
      text-align: left;
    }

    label {
      display: block;
      margin-bottom: 8px;
      color: #555;
      font-weight: 500;
    }

    input {
      width: 100%;
      padding: 12px 15px;
      border: 2px solid #e0e6ed;
      border-radius: 8px;
      font-size: 16px;
      transition: all 0.3s ease;
    }

    input:focus {
      border-color: #4a6fa5;
      outline: none;
      box-shadow: 0 0 0 3px rgba(74, 111, 165, 0.2);
    }

    .btn-login {
      background: linear-gradient(to right, #4a6fa5, #6b8cae);
      color: white;
      border: none;
      padding: 12px 30px;
      border-radius: 8px;
      cursor: pointer;
      font-size: 16px;
      font-weight: 500;
      width: 100%;
      transition: all 0.3s ease;
      margin-top: 10px;
    }

    .btn-login:hover {
      background: linear-gradient(to right, #3a5a80, #5b7c9e);
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(74, 111, 165, 0.3);
    }

    .forgot-password {
      display: block;
      margin-top: 20px;
      color: #6b8cae;
      text-decoration: none;
      font-size: 14px;
    }

    .forgot-password:hover {
      color: #4a6fa5;
    }

    .divider {
      margin: 25px 0;
      height: 1px;
      background: linear-gradient(to right, transparent, #e0e6ed, transparent);
    }

    footer {
      background-color: #333;
      color: white;
      text-align: center;
      padding: 15px 0;
      font-size: 14px;
      position: fixed;
      width: 100%;
      bottom: 0;
    }

    .navbar-custom .nav-link {
      color: beige !important;
    }

    .navbar-custom {
      background-color: brown;
    }

    .header-logo {
      background-color: brown;
      padding: 10px;
      color: white;
      font-size: 20px;
      text-align: center;
    }
  </style>
</head>
<body>

 
  <div class="header-title">THE CAMPUS CART AND CARE</div>

  <nav class="navbar navbar-expand-lg navbar-custom" style="background-color:#333">
    <div class="container-fluid">
      <a class="navbar-brand text-white" href="#">
        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart-check-fill" viewBox="0 0 16 16">
          <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 ..."/>
        </svg>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item"><a class="nav-link" href="ThrHomePage.html">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
          <li class="nav-item"><a class="nav-link" href="SignupServlet">Signup</a></li>
          <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
          <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
          <li class="nav-item"><a class="nav-link" href="content.jsp">Content</a></li>
        </ul>
        <a class="btn btn-light text-dark" href="caretakerlogin.jsp">Caretaker Login</a>
      </div>
    </div>
  </nav>

  <div class="d-flex justify-content-center align-items-center" style="padding: 2rem;">
    <div class="login-container">
      <h2>Caretaker Login</h2>
      <form action="CaretakerLoginServlet" method="post">
        <div class="input-group">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="input-group">
          <label for="password">Password</label>
          <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <button type="submit" style="background-color:brown;" class="btn-login">Login</button>
        <a href="#" class="forgot-password">Forgot password?</a>
        <div class="divider"></div>
        <p style="color: #777; font-size: 14px;">Don't have an account? <a href="#" style="color: #4a6fa5;">Contact admin</a></p>
      </form>
    </div>
  </div>

  <footer>
    <p>&copy; 2025 Campus Cart. All rights reserved.</p>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
