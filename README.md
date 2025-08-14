# mavensample
hii this is a campus cart and care website.
# Campus Cart and Care 🛒🏫

**Campus Cart and Care** is a full-stack web application built to support university students in managing campus life more efficiently. The platform allows students to **buy and sell second-hand products**, such as clothes, bags, shoes, books, and more, as well as **raise hostel- or center-related complaints** that get forwarded to caretakers or deans via email.

## 🔥 Features

### 🛍️ Campus Cart
- Student-run stores for selling clothes, bags, books, and other items.
- Product categories and filtering by type.
- Product upload with image, price, and description.
- Contact Seller button to email the seller directly.
- Option to request **custom designs** from student designers.
- Product reviews and ratings by other students.

### 🛠️ Campus Care
- Student login system to submit complaints related to hostels/centers.
- Dropdown to select hostel/center.
- Complaints stored with status: `pending` or `resolved`.
- Caretaker login to view complaints for their assigned hostel.
- "Mark as Resolved" button which updates the status and records the resolution date.

## 👨‍💻 Technologies Used

- **Frontend:** HTML, CSS, JSP, JavaScript
- **Backend:** Java (Servlets), Apache Tomcat
- **Database:** MySQL
- **Tools:** Maven, JDBC
- **Email Integration:** JavaMail API

## 📂 Folder Structure


/campus-cart-care
│
├── /src → Java servlet source files
├── /web → JSP and static frontend files
├── /sql → MySQL database export files
├── /images → Uploaded product images
├── /assets → CSS and JavaScript assets
└── README.md

bash
Copy
Edit

## ⚙️ How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/Chanchala9876/the_campus_cart_and_care.git
Import as a Maven project in Eclipse or IntelliJ.

Set up MySQL:

Create the database and tables using the provided .sql file in /sql.

Update database credentials in DBConnection.java.

Deploy the project on Apache Tomcat.

Open the browser and go to:

bash
Copy
Edit
http://localhost:8086/mavensample/ThrHomePage.html
🔒 Security Notes
All student and caretaker logins are validated using database credentials.

Email communication is handled securely using JavaMail.

📧 Contact
Created by Chanchala Kumari
📬 chanch51_scs@gmail.com

A complete solution for simplifying student life on campus.


