<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Available Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
              
        }

        .product-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .product {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            width: 250px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .product img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        .product h3 {
            margin: 10px 0 5px;
        }

        .product p {
            margin: 5px 0;
        }

        .product .price {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Products for Sale</h2>
    <div class="product-grid">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/campuscart", "root", "chanjhalaA1!");

                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT title, description, price, image_url FROM product WHERE status='available'");

                while (rs.next()) {
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
                    String imageUrl = rs.getString("image_url");
        %>
            <div class="product">
                <img src="<%= imageUrl %>" alt="<%= title %>">
                <h3><%= title %></h3>
                <p><%= description %></p>
                <p class="price">₹ <%= price %></p>
            </div>
        <%
                }

                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </div>
</body>
</html>
