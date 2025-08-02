-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: campuscart
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `cname` varchar(45) NOT NULL,
  `image` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`,`image`),
  UNIQUE KEY `cname_UNIQUE` (`cname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'Appliances','uploads/App.jpg'),(3,'Books','uploads/LIBRARY17.jpg'),(1,'Clothing','uploads/Cloth2.jpg'),(4,'Vehicles','uploads/Vehicle.jpeg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint` (
  `complaint_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `hostel_id` int DEFAULT NULL,
  `complaint_text` text NOT NULL,
  `status` enum('pending','resolved') DEFAULT 'pending',
  `submitted_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `resolved_on` datetime DEFAULT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `student_id` (`student_id`),
  KEY `hostel_id` (`hostel_id`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (1,1,6,'hmjhlkl','resolved','2025-05-03 03:47:36','2025-05-05 02:28:57'),(2,1,10,'i donot have window in my room.','resolved','2025-05-03 18:01:56','2025-05-03 22:21:04'),(3,6,8,'room no.:-9\r\ni want to change me window.','pending','2025-05-03 23:59:20',NULL),(4,1,10,'please clean our whiteboard everyday...','pending','2025-05-04 17:20:32',NULL),(5,9,6,'i am a student in room no. 9 and there is no gate in my almirah.','pending','2025-05-05 02:22:00',NULL),(6,13,10,'hhghgj','pending','2025-07-08 22:24:55',NULL);
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel`
--

DROP TABLE IF EXISTS `hostel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel` (
  `hostel_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` enum('hostel','centre') NOT NULL,
  `caretaker_email` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel`
--

LOCK TABLES `hostel` WRITE;
/*!40000 ALTER TABLE `hostel` DISABLE KEYS */;
INSERT INTO `hostel` VALUES (6,'chandrabhaga','hostel','chanchalakumari1950@gmail.com','12345'),(7,'shipra','hostel','vidhityagi888@gmail.com','12345'),(8,'lohit','hostel','sharmagolden142@gmail.com','12345'),(9,'barak','hostel','nityasingh559@gmail.com','12345'),(10,'scss','centre','jhalkumari2003@gmail.com','12345');
/*!40000 ALTER TABLE `hostel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `status` enum('available','sold') DEFAULT 'available',
  `posted_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `category_id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  KEY `studentId_idx` (`student_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `studentId` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'car','nmns',56778.00,'uploads/youtube4.jpg','available','2025-05-03 23:31:18',2,1),(2,'bicycle','this is a 6 month old cycle, please contact me to buy.',2000.00,'uploads/Vehicle.jpeg','available','2025-05-03 23:58:21',4,6),(3,'kettle','i have this kettle i have used only for two months. it is almost new.',1000.00,'uploads/Clothes2.jpg','sold','2025-05-05 02:18:28',2,9),(4,'Top','i have this top that i have worn only once.',200.00,'uploads/scarves.jpg','available','2025-05-05 02:21:07',1,9),(5,'book','i have this book i want to sell',100.00,'uploads/LIBRARY17.jpg','available','2025-05-05 02:23:37',3,9),(6,'book','i have a book i want to sell',300.00,'uploads/cart1.jpg','available','2025-05-05 11:46:23',3,9),(7,'bicycle','gyhjgj',7999.00,'uploads/sabesh-photography-ltd-Xqa_NWl4xEY-unsplash.jpg','available','2025-07-08 22:23:42',2,13);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `hostel_id` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`),
  KEY `hostel_id` (`hostel_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'chanchala','vidhityagi888@gmail.com','1234',6),(2,'vidhi','v@k','12345',7),(3,'nitya','n@k','12345',8),(4,'golden','g@k','1234',9),(5,'sunita','sunita@k','1234',7),(6,'kabita','jhalkumari2003@gmail.com','1234',8),(8,'namrta','nam@k','1234',7),(9,'chanchala','chanchalakumari1950@gmail.com','1234',7),(12,'chanchala','sharmagolden142@gmail.com','1234',8),(13,'chandani','cg@k','1234',8);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-02 22:24:20
