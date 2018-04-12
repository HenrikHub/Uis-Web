-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: dat310_assignment8
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `property_ID` int(11) DEFAULT NULL,
  `checkin` varchar(20) NOT NULL,
  `checkout` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `street` text NOT NULL,
  `city` text NOT NULL,
  `postcode` varchar(5) NOT NULL,
  `country` text NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `property_ID` (`property_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`property_ID`) REFERENCES `properties` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `location` varchar(30) NOT NULL,
  `description` varchar(500) NOT NULL,
  `details` varchar(1000) NOT NULL,
  `photo` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,'Holiday home Røros','Røros, Sør-Trøndelag','The property features views of the sea and is 23 km from Røros.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sodales neque quis nisi facilisis lobortis. Nam efficitur eget nisi sit amet bibendum. \nVestibulum elementum faucibus quam ut posuere. Vivamus pellentesque luctus nunc at bibendum. Mauris viverra ultrices nisi, \nsit amet imperdiet lectus accumsan eu. Morbi ornare diam nulla, nec aliquet nisl accumsan dictum. Mauris sit amet tellus in ipsum commodo hendrerit. \nNunc at mollis magna. Proin felis nibh, venenatis non lobortis quis, ullamcorper nec dolor. Vivamus tempus volutpat fringilla. \nPraesent volutpat sit amet massa nec ultricies. Curabitur sollicitudin pharetra tortor in dictum. In mattis orci vel augue vehicula rutrum. \nNullam vitae sollicitudin orci.','property_1.png'),(2,'Oppdal Turisthotell','Oppdal, Sør-Trøndelag','It offers free parking and rooms with free WiFi and a private bathroom. Oppdal Ski Centre is a 10-minute walk away.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sodales neque quis nisi facilisis lobortis. Nam efficitur eget nisi sit amet bibendum. \nVestibulum elementum faucibus quam ut posuere. Vivamus pellentesque luctus nunc at bibendum. Mauris viverra ultrices nisi, \nsit amet imperdiet lectus accumsan eu. Morbi ornare diam nulla, nec aliquet nisl accumsan dictum. Mauris sit amet tellus in ipsum commodo hendrerit. \nNunc at mollis magna. Proin felis nibh, venenatis non lobortis quis, ullamcorper nec dolor. Vivamus tempus volutpat fringilla. \nPraesent volutpat sit amet massa nec ultricies. Curabitur sollicitudin pharetra tortor in dictum. In mattis orci vel augue vehicula rutrum. \nNullam vitae sollicitudin orci.','property_2.png'),(3,'Granmo Camping','Oppdal, Sør-Trøndelag','Granmo Camping is scenically situated in Oppdal, right by Dovrefjell National Park. Facilities include a mini-market and, a snack bar and a shared kitchen.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sodales neque quis nisi facilisis lobortis. Nam efficitur eget nisi sit amet bibendum. \nVestibulum elementum faucibus quam ut posuere. Vivamus pellentesque luctus nunc at bibendum. Mauris viverra ultrices nisi, \nsit amet imperdiet lectus accumsan eu. Morbi ornare diam nulla, nec aliquet nisl accumsan dictum. Mauris sit amet tellus in ipsum commodo hendrerit. \nNunc at mollis magna. Proin felis nibh, venenatis non lobortis quis, ullamcorper nec dolor. Vivamus tempus volutpat fringilla. \nPraesent volutpat sit amet massa nec ultricies. Curabitur sollicitudin pharetra tortor in dictum. In mattis orci vel augue vehicula rutrum. \nNullam vitae sollicitudin orci.','property_3.png'),(4,'Sjøberg Ferie','Østhusvik, Rogaland','These modern apartments are set on Rennesøy island. Boats can be rented on site.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sodales neque quis nisi facilisis lobortis. Nam efficitur eget nisi sit amet bibendum. \nVestibulum elementum faucibus quam ut posuere. Vivamus pellentesque luctus nunc at bibendum. Mauris viverra ultrices nisi, \nsit amet imperdiet lectus accumsan eu. Morbi ornare diam nulla, nec aliquet nisl accumsan dictum. Mauris sit amet tellus in ipsum commodo hendrerit. \nNunc at mollis magna. Proin felis nibh, venenatis non lobortis quis, ullamcorper nec dolor. Vivamus tempus volutpat fringilla. \nPraesent volutpat sit amet massa nec ultricies. Curabitur sollicitudin pharetra tortor in dictum. In mattis orci vel augue vehicula rutrum. \nNullam vitae sollicitudin orci.','property_4.png'),(5,'Holiday home Jørpeland Høllesli','Forsand, Rogaland','Holiday home Jørpeland Høllesli offers accommodation in Forsand, 21 km from Stavanger and 23 km from Sandnes.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sodales neque quis nisi facilisis lobortis. Nam efficitur eget nisi sit amet bibendum. \nVestibulum elementum faucibus quam ut posuere. Vivamus pellentesque luctus nunc at bibendum. Mauris viverra ultrices nisi, \nsit amet imperdiet lectus accumsan eu. Morbi ornare diam nulla, nec aliquet nisl accumsan dictum. Mauris sit amet tellus in ipsum commodo hendrerit. \nNunc at mollis magna. Proin felis nibh, venenatis non lobortis quis, ullamcorper nec dolor. Vivamus tempus volutpat fringilla. \nPraesent volutpat sit amet massa nec ultricies. Curabitur sollicitudin pharetra tortor in dictum. In mattis orci vel augue vehicula rutrum. \nNullam vitae sollicitudin orci.','property_5.png'),(6,'Høiland Gard','Årdal, Rogaland','This self catering accommodation, Høiland Gard, is located 5 minutes’ drive from Årdal village. Eventyrskogen Hiking Trail is 1 km away.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sodales neque quis nisi facilisis lobortis. Nam efficitur eget nisi sit amet bibendum. \nVestibulum elementum faucibus quam ut posuere. Vivamus pellentesque luctus nunc at bibendum. Mauris viverra ultrices nisi, \nsit amet imperdiet lectus accumsan eu. Morbi ornare diam nulla, nec aliquet nisl accumsan dictum. Mauris sit amet tellus in ipsum commodo hendrerit. \nNunc at mollis magna. Proin felis nibh, venenatis non lobortis quis, ullamcorper nec dolor. Vivamus tempus volutpat fringilla. \nPraesent volutpat sit amet massa nec ultricies. Curabitur sollicitudin pharetra tortor in dictum. In mattis orci vel augue vehicula rutrum. \nNullam vitae sollicitudin orci.','property_6.png');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-11 22:26:58
