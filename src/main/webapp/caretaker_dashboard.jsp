<%@ page import="java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*" %>
<%
    Integer hostelId = (session != null) ? (Integer) session.getAttribute("hostel_id") : null;
    if (hostelId == null) {
        response.sendRedirect("caretakerlogin.jsp");
        return;
    }

    String jdbcURL = "jdbc:mysql://localhost:3306/campuscart";
    String dbUser = "root";
    String dbPassword = "chanjhalaA1!";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Caretaker Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --dark-brown: #5D4037;
            --medium-brown: #8D6E63;
            --light-brown: #D7CCC8;
            --cream-beige: #F5F5F0;
            --warm-beige: #EFEBE9;
            --accent-gold: #D4AF37;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--warm-beige);
            color: var(--dark-brown);
            line-height: 1.6;
        }
        
        .navbar {
            background-color: var(--dark-brown) !important;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .navbar-brand, .nav-link {
            color: var(--cream-beige) !important;
            font-weight: 500;
        }
        
        .navbar-brand {
            font-family: 'Georgia', serif;
            font-size: 1.5rem;
            letter-spacing: 1px;
        }
        
        .nav-link:hover {
            color: var(--accent-gold) !important;
        }
        
        .container {
            margin-top: 30px;
            padding-bottom: 50px;
        }
        
        .page-title {
            color: var(--dark-brown);
            font-weight: 300;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 15px;
            text-align: center;
        }
        
        .page-title:after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: var(--accent-gold);
        }
        
        .card {
            border: none;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background-color: var(--cream-beige);
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.12);
        }
        
        .card-header {
            background-color: var(--medium-brown);
            color: white;
            font-weight: 500;
            padding: 15px 20px;
            border-bottom: 2px solid var(--accent-gold);
        }
        
        .card-body {
            padding: 25px;
        }
        
        .complaint-text {
            font-size: 1.05rem;
            line-height: 1.7;
            color: var(--dark-brown);
            margin-bottom: 20px;
        }
        
        .btn-resolve {
            background-color: var(--medium-brown);
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 4px;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            font-size: 0.85rem;
        }
        
        .btn-resolve:hover {
            background-color: var(--dark-brown);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .btn-info {
            background-color: var(--accent-gold);
            color: var(--dark-brown);
            border: none;
            font-weight: 500;
        }
        
        .btn-info:hover {
            background-color: #C9A227;
            color: white;
        }
        
        .alert {
            border-radius: 8px;
        }
        
        .footer {
            background-color: var(--dark-brown);
            color: var(--cream-beige);
            padding: 20px 0;
            margin-top: 50px;
            text-align: center;
        }
        
        .student-id {
            display: inline-block;
            background-color: var(--light-brown);
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 0.85rem;
            color: var(--dark-brown);
            margin-bottom: 10px;
        }
        
        .empty-state {
            text-align: center;
            padding: 50px;
            color: var(--medium-brown);
        }
        
        .empty-state i {
            font-size: 3rem;
            margin-bottom: 20px;
            color: var(--light-brown);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-home me-2"></i>Hostel Complaints
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#"><i class="fas fa-tachometer-alt me-1"></i> Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.html"><i class="fas fa-info-circle me-1"></i> About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.html"><i class="fas fa-envelope me-1"></i> Contact</a>
                    </li>
                </ul>
                <form action="student_activities.jsp" method="get" class="d-flex">
                    <button type="submit" class="btn btn-info">
                        <i class="fas fa-tasks me-1"></i> Your Activities
                    </button>
                </form>
            </div>
        </div>
    </nav>

    <div class="container">
        <h1 class="page-title"><i class="fas fa-clipboard-list me-2"></i>Complaints for Your Hostel</h1>
        
        <div class="row">
            <%
                boolean hasComplaints = false;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                    String sql = "SELECT * FROM complaint WHERE hostel_id = ? AND status = 'pending'";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, hostelId);
                    ResultSet rs = stmt.executeQuery();

                    while (rs.next()) {
                        hasComplaints = true;
                        int complaintId = rs.getInt("complaint_id");
            %>
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <span><i class="fas fa-user-circle me-2"></i>Student Complaint</span>
                        <span class="badge bg-warning text-dark">Pending</span>
                    </div>
                    <div class="card-body">
                        <div class="student-id">
                            <i class="fas fa-id-card me-1"></i> Student ID: <%= rs.getInt("student_id") %>
                        </div>
                        <div class="complaint-text">
                            <i class="fas fa-comment-dots me-2"></i> <%= rs.getString("complaint_text") %>
                        </div>
                        <form action="ResolveComplaintServlet" method="post">
                            <input type="hidden" name="complaint_id" value="<%= complaintId %>">
                            <button type="submit" class="btn btn-resolve">
                                <i class="fas fa-check-circle me-1"></i> Mark as Resolved
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                    }
                    
                    if (!hasComplaints) {
            %>
            <div class="col-12">
                <div class="empty-state">
                    <i class="fas fa-check-circle"></i>
                    <h3>No Pending Complaints</h3>
                    <p>All complaints have been resolved. Great job!</p>
                </div>
            </div>
            <%
                    }

                    conn.close();
                } catch (Exception e) {
            %>
            <div class="col-12">
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-triangle me-2"></i> Error: <%= e.getMessage() %>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <p class="mb-0">&copy; 2025 Campus cart and care System. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add animation to cards when page loads
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.card');
            cards.forEach((card, index) => {
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100);
            });
        });
    </script>
</body>
</html>