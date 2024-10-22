CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Customer'),(3,'Manager'),(4,'Tour Guide');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_image`
--

DROP TABLE IF EXISTS `tour_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `tp_id` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `tp_id` (`tp_id`),
  CONSTRAINT `tour_image_ibfk_1` FOREIGN KEY (`tp_id`) REFERENCES `tour_package` (`tour_package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_image`
--

LOCK TABLES `tour_image` WRITE;
/*!40000 ALTER TABLE `tour_image` DISABLE KEYS */;
INSERT INTO `tour_image` VALUES (1,1,'djkksfhjkd');
/*!40000 ALTER TABLE `tour_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_member`
--

DROP TABLE IF EXISTS `tour_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `tt_id` int DEFAULT NULL,
  `fname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `aadhar_no` varchar(15) NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `aadhar_no_UNIQUE` (`aadhar_no`),
  KEY `user_id` (`user_id`),
  KEY `tt_id` (`tt_id`),
  CONSTRAINT `tour_member_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `tour_member_ibfk_2` FOREIGN KEY (`tt_id`) REFERENCES `tour_transaction` (`tour_transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_member`
--

LOCK TABLES `tour_member` WRITE;
/*!40000 ALTER TABLE `tour_member` DISABLE KEYS */;
INSERT INTO `tour_member` VALUES (1,2,1,'Pratham','kadu','734737687');
/*!40000 ALTER TABLE `tour_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_package`
--

DROP TABLE IF EXISTS `tour_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_package` (
  `tour_package_id` int NOT NULL AUTO_INCREMENT,
  `tour_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `no_of_seats` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `mgr_id` int DEFAULT NULL,
  `guide_id` int DEFAULT NULL,
  PRIMARY KEY (`tour_package_id`),
  KEY `mgr_id` (`mgr_id`),
  KEY `guide_id` (`guide_id`),
  CONSTRAINT `tour_package_ibfk_1` FOREIGN KEY (`mgr_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `tour_package_ibfk_2` FOREIGN KEY (`guide_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `tour_package_chk_1` CHECK ((`price` > 0)),
  CONSTRAINT `tour_package_chk_2` CHECK ((`duration` > 0)),
  CONSTRAINT `tour_package_chk_3` CHECK ((`no_of_seats` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_package`
--

LOCK TABLES `tour_package` WRITE;
/*!40000 ALTER TABLE `tour_package` DISABLE KEYS */;
INSERT INTO `tour_package` VALUES (1,'Nainital Lake Tour','Picturesque boat rides, serene views and charming lakeside ambience amidst lush hills.',65000,'2024-08-25 05:30:00.000000','2024-08-31 05:30:00.000000',6,22,'upcoming',3,7),(13,'Kerala Tour','Experience the beauty of every exotic part of Kerala during this monsoon that offers ecstasy, beauty and heavenly pleasure when you are vacationing.\n',9999,'2024-08-20 05:30:00.000000','2024-08-25 05:30:00.000000',6,20,'pending',3,7),(20,'Royal Rajasthan Tour','Explore the majestic forts, palaces, and deserts of Rajasthan, immersing in royal heritage and vibrant culture',14999,'2024-08-22 05:30:00.000000','2024-08-30 05:30:00.000000',8,30,'pending',3,17),(21,'Kashmir Tour','Experience the breathtaking beauty of Kashmir: lush valleys, serene lakes, and majestic mountains await you',21999,'2024-08-24 05:30:00.000000','2024-08-31 05:30:00.000000',7,24,'pending',3,17),(22,'Shimla Kullu Manali','Explore Shimla\'s colonial charm, Kullu\'s natural beauty, and Manali\'s adventure in a breathtaking Himalayan journey',45000,'2024-09-01 05:30:00.000000','2024-09-12 05:30:00.000000',12,30,'pending',3,16),(23,'Goa','Discover Goa\'s stunning coastlines, rich culture, serene beaches, and energetic festivals in a captivating journey',8000,'2024-08-25 05:30:00.000000','2024-08-30 05:30:00.000000',1,25,'pending',3,16);
/*!40000 ALTER TABLE `tour_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_payment`
--

DROP TABLE IF EXISTS `tour_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `tour_transaction_id` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `payment_date` datetime(6) NOT NULL,
  `payment_mode` varchar(15) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `tour_transaction_id` (`tour_transaction_id`),
  CONSTRAINT `tour_payment_ibfk_1` FOREIGN KEY (`tour_transaction_id`) REFERENCES `tour_transaction` (`tour_transaction_id`),
  CONSTRAINT `tour_payment_chk_1` CHECK ((`amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_payment`
--

LOCK TABLES `tour_payment` WRITE;
/*!40000 ALTER TABLE `tour_payment` DISABLE KEYS */;
INSERT INTO `tour_payment` VALUES (1,1,20000,'2024-08-05 00:00:00.000000','online');
/*!40000 ALTER TABLE `tour_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_transaction`
--

DROP TABLE IF EXISTS `tour_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_transaction` (
  `tour_transaction_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(30) NOT NULL,
  `booking_date` datetime(6) NOT NULL,
  `user_id` int DEFAULT NULL,
  `tour_package_id` int DEFAULT NULL,
  `package_id` int DEFAULT NULL,
  PRIMARY KEY (`tour_transaction_id`),
  KEY `user_id` (`user_id`),
  KEY `tour_package_id` (`tour_package_id`),
  CONSTRAINT `tour_transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `tour_transaction_ibfk_2` FOREIGN KEY (`tour_package_id`) REFERENCES `tour_package` (`tour_package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_transaction`
--

LOCK TABLES `tour_transaction` WRITE;
/*!40000 ALTER TABLE `tour_transaction` DISABLE KEYS */;
INSERT INTO `tour_transaction` VALUES (1,'pending','2024-08-05 00:00:00.000000',2,1,NULL);
/*!40000 ALTER TABLE `tour_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `aadhar_no` varchar(15) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_no` (`phone_no`),
  UNIQUE KEY `aadhar_no_UNIQUE` (`aadhar_no`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'abhay','tiwari','abhay@gmail.com','hgdshgd','64745746','Delhi','7683753484',1),(2,'Pratham','kadu','pratham@gmail.com','hdfefguyu','873478464','Loni','734637687',2),(3,'aa','ss','aa@gmail.com','$2a$11$CAhv3AQHJZfjMFwTVOpEX.EX9kIDfLeLg96999WKbvpO7YzsZZRqq','1234','pune','99',1),(5,'jdhfjsg','hgf','jrhjwg@gmail.com','gfwhghe','765756','hgdf','745367',4),(6,'kk','jj','hh@gmail.com','$2a$11$4.0XMxnvgxBHSUgLFYoW.eTElBNwP.44pvI6/vHdWk/xVcOsm/x3m','12345','pune','78907890',2),(7,'ff','ll','ff@gmail.com','$2a$11$1mTDcfjub6leqhlPEguAiuY1MaWrAbDmj6TZz6qfosKmv0Xsy/o0e','987654321','noida','09798678',3),(9,'prath','mesh','prath@gmail.com','$2a$11$IIWh/ZY8fvmcfKlBkrtRZ.7AS8lkhVdM.44MgqtzWB8JFU/zUEuoS','99775533','nagpur','6558767',3),(10,'dipak','koli','dipak@gmail.com','$2a$11$kaQQ13vGUTB.jRF3wOgDdO60BJaXCnk.q7uWuk3stKr0suCJ7kOgy','5566337788','nasik','4545646776',1),(11,'bakul','joshi','xxx@yyy.com','$2a$11$3SXpIRRKgZOCE0GgHaJTluixRefQLIUUkI4VIzqyc2N.IRG6YqWCy','4566189002','pune','123456789012',2),(12,'krushna','bhot','bhot@gmail.com','1234','5436786543','Goa','434567898762',2),(13,'krushna','bhot','krushna@gmail.com','$2a$11$vaBkI9rK.9GVaDqFtXQfC.PTgR1amD8XrjQWbYaKtY46TSptxisG.','7345897989','pune','234578987656',2),(14,'Vicky','Singh','Vicky@gmail.com','$2a$11$42BeIz4jdgymPpnvUxNRHeN5WalDoGRcfJ4js23ZhDoQ2UohMz4Yi','1234567898','Juhu','768654345684',3),(16,'Lucky','Singh','Lucky@gmail.com','$2a$11$f/PgBgmVM5FYbsRNdUGeZ.50fXV3FRx8xo84pbFBYXFnXsTGVc0Pa','1234567896','pune','768654347876',4),(17,'Vijay','Singh','Vijay@gmail.com','$2a$11$GcWbZpRvn1ri03GOEG0Vked8TxtORG0JWPEIK.hisrWA644JdolLa','1234567893','Solapur','768654347800',4);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 12:48:44
