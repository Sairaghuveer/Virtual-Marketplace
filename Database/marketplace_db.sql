DROP DATABASE IF EXISTS `virtualmart`;
CREATE DATABASE `virtualmart`;
USE `virtualmart`;

SET NAMES utf8;
SET character_set_client = utf8mb4;

/* Users table to store users data where Active_State = 1 denotes the user is active in the system*/

CREATE TABLE `users` (
   `User_ID` int NOT NULL AUTO_INCREMENT,
   `User_Name` varchar(20) DEFAULT NULL,
   `User_Pass` varchar(30) NOT NULL,
   `First_Name` varchar(30) NOT NULL,
   `Last_Name` varchar(30) NOT NULL,
   `Gender` varchar(10) DEFAULT NULL,
   `Email` varchar(50) NOT NULL,
   `Phone_Number` bigint DEFAULT NULL,
   `Created_Timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
   `Active_State` int DEFAULT '1',
   PRIMARY KEY (`User_ID`),
   UNIQUE KEY `User_Name` (`User_Name`),
   UNIQUE KEY `Phone_Number` (`Phone_Number`)
 ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 INSERT INTO users VALUES(1,'root','superuser111','root','root','null','raghu991k@gmail.com',2222222222,current_timestamp(),1),
						(2,'Admin','Admin111','Admin','Admin','null','surya.munuganti@gmail.com',1111111111,current_timestamp(),1);
 
  /*A location table to store the location ID's, name and codes where ID is used to uniquely idnetify the locatioon, and codes can also be used for that as it is unique*/
 
 CREATE TABLE `location` (
   `Loc_ID` int NOT NULL,
   `Loc_Name` varchar(20) NOT NULL,
   `Loc_Code` varchar(5) DEFAULT NULL,
   PRIMARY KEY (`Loc_ID`),
   UNIQUE KEY `Loc_Code` (`Loc_Code`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 INSERT INTO location VALUES (1, 'Montreal', 'mtl'),
							(2, 'Laval','lav');
 /*To specify the item condition which is helpful for the customers to filter products based on their needs*/
 
 CREATE TABLE `item_condition_type` (
   `Item_Condition_ID` int NOT NULL,
   `Item_Condition_Type` varchar(20) NOT NULL,
   PRIMARY KEY (`Item_Condition_ID`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 INSERT INTO item_condition_type VALUES (1, 'New'),
										(2, 'Used');
 
  /*A category table to store the different categories in the table*/
 
 CREATE TABLE `category` (
   `Category_ID` int NOT NULL,
   `Category_Name` varchar(30) NOT NULL,
   PRIMARY KEY (`Category_ID`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 INSERT INTO category VALUES(1,'automobiles bikes'),
							(2,'electronics'),
							(3,'real estate'),
							(4,'furniture'),
							(5,'books'),
							(6,'others');
 
 /*A table to store all the ads posted by a seller which is a pool of ads available where user ID indicated the ID of the seller
Availability defines whether the product is available or sold out, and Upd_Del field specifies if there were any updations or deltions performed
and image path specifies the path of the image stored in the directory*/

 CREATE TABLE `ads_posted` (
   `Prod_ID` int NOT NULL AUTO_INCREMENT,
   `Prod_Name` varchar(50) NOT NULL,
   `Prod_Description` varchar(255) DEFAULT NULL,
   `Prod_Price` int NOT NULL,
   `Loc_ID` int DEFAULT NULL,
   `Category_Name` varchar(30) NOT NULL,
   `Sub_Category_Name` varchar(30),
   `User_ID` int DEFAULT NULL,
   `Item_Condition_ID` int DEFAULT NULL,
   `Posted_Timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
   `Availability` varchar(20) DEFAULT 'available',
   `Upd_Del` varchar(20) DEFAULT NULL,
   `image_path` varchar(1024) DEFAULT NULL,
   PRIMARY KEY (`Prod_ID`),
   KEY `User_ID` (`User_ID`),
   KEY `Item_Condition_ID` (`Item_Condition_ID`),
   KEY `Loc_ID` (`Loc_ID`),
   CONSTRAINT `ads_posted_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`),
   CONSTRAINT `ads_posted_ibfk_2` FOREIGN KEY (`Item_Condition_ID`) REFERENCES `item_condition_type` (`Item_Condition_ID`),
   CONSTRAINT `ads_posted_ibfk_3` FOREIGN KEY (`Loc_ID`) REFERENCES `location` (`Loc_ID`)
 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 /*A table to store all the messages between the potential buyer and seller starting with message ID 101*/
 
 CREATE TABLE `messages` (
   `Buyer_ID` int NOT NULL,
   `Seller_ID` int NOT NULL,
   `Prod_ID` int NOT NULL,
   `Message_ID` int NOT NULL AUTO_INCREMENT,
   `MSG_Timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
   `Buyer_MSG` varchar(512) DEFAULT NULL,
   `Seller_MSG` varchar(512) DEFAULT NULL,
   PRIMARY KEY (`Message_ID`),
   KEY `Buyer_ID` (`Buyer_ID`),
   KEY `Prod_ID` (`Prod_ID`),
   KEY `Seller_ID` (`Seller_ID`),
   CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`Buyer_ID`) REFERENCES `users` (`User_ID`),
   CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`Prod_ID`) REFERENCES `ads_posted` (`Prod_ID`),
   CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`Seller_ID`) REFERENCES `users` (`User_ID`)
 ) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 /* A user searcgh table which specifies the search done by users in the application*/
 
 CREATE TABLE `user_search` (
   `Search_ID` int NOT NULL AUTO_INCREMENT,
   `Search_Name` varchar(100) NOT NULL,
   `Category_ID` int DEFAULT NULL,
   `Sub_Category_ID` int DEFAULT NULL,
   `Item_Condition_Type` varchar(30) DEFAULT NULL,
   PRIMARY KEY (`Search_ID`),
   KEY `Category_ID` (`Category_ID`),
   CONSTRAINT `user_search_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 CREATE TABLE `automobile_bikes` (
   `Prod_ID` int NOT NULL,
   `Category_ID` int DEFAULT '1',
   `Make` varchar(20) DEFAULT NULL,
   `Model` varchar(20) DEFAULT NULL,
   `Color` varchar(20) DEFAULT NULL,
   `Vehicle_Type` varchar(20) DEFAULT NULL,
   `Kilometers` int DEFAULT NULL,
   `No Of Owners` int DEFAULT NULL,
   KEY `Prod_ID` (`Prod_ID`),
   KEY `Category_ID` (`Category_ID`),
   CONSTRAINT `automobile_bikes_ibfk_1` FOREIGN KEY (`Prod_ID`) REFERENCES `ads_posted` (`Prod_ID`),
   CONSTRAINT `automobile_bikes_ibfk_2` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 CREATE TABLE `electronics` (
   `Prod_ID` int NOT NULL,
   `Category_ID` int DEFAULT '2',
   `Laptop` varchar(5) DEFAULT NULL,
   `Television` varchar(5) DEFAULT NULL,
   `Mobile` varchar(5) DEFAULT NULL,
   `Computer` varchar(5) DEFAULT NULL,
   `Computer Accessories` varchar(5) DEFAULT NULL,
   `Other` varchar(5) DEFAULT NULL,
   KEY `Prod_ID` (`Prod_ID`),
   KEY `Category_ID` (`Category_ID`),
   CONSTRAINT `electronics_ibfk_1` FOREIGN KEY (`Prod_ID`) REFERENCES `ads_posted` (`Prod_ID`),
   CONSTRAINT `electronics_ibfk_2` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 CREATE TABLE `furniture` (
   `Prod_ID` int NOT NULL,
   `Category_ID` int DEFAULT '3',
   `Chair` varchar(5) DEFAULT NULL,
   `Table` varchar(5) DEFAULT NULL,
   `Desk` varchar(5) DEFAULT NULL,
   `Bed` varchar(5) DEFAULT NULL,
   `Other` varchar(5) DEFAULT NULL,
   KEY `Prod_ID` (`Prod_ID`),
   KEY `Category_ID` (`Category_ID`),
   CONSTRAINT `furniture_ibfk_1` FOREIGN KEY (`Prod_ID`) REFERENCES `ads_posted` (`Prod_ID`),
   CONSTRAINT `furniture_ibfk_2` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 CREATE TABLE `real_estate` (
   `Prod_ID` int NOT NULL,
   `Category_ID` int DEFAULT '4',
   `Short Term Rent` varchar(5) DEFAULT NULL,
   `Long Term Rent` varchar(5) DEFAULT NULL,
   `House for sale` varchar(5) DEFAULT NULL,
   KEY `Prod_ID` (`Prod_ID`),
   KEY `Category_ID` (`Category_ID`),
   CONSTRAINT `real_estate_ibfk_1` FOREIGN KEY (`Prod_ID`) REFERENCES `ads_posted` (`Prod_ID`),
   CONSTRAINT `real_estate_ibfk_2` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 CREATE TABLE `books` (
   `Prod_ID` int NOT NULL,
   `Category_ID` int DEFAULT '5',
   `Textbooks` varchar(5) DEFAULT NULL,
   `Magazines` varchar(5) DEFAULT NULL,
   `Comics` varchar(5) DEFAULT NULL,
   `Other` varchar(5) DEFAULT NULL,
   KEY `Prod_ID` (`Prod_ID`),
   KEY `Category_ID` (`Category_ID`),
   CONSTRAINT `books_ibfk_1` FOREIGN KEY (`Prod_ID`) REFERENCES `ads_posted` (`Prod_ID`),
   CONSTRAINT `books_ibfk_2` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
Alter table ads_posted drop foreign key `ads_posted_ibfk_1`, Add foreign key `ads_posted_ibfk_1` (`User_ID`) references `users` (`User_ID`) ON delete cascade on update cascade;

Alter table messages drop foreign key `messages_ibfk_2`, Add foreign key `messages_ibfk_2` (`Prod_ID`) references `ads_posted` (`Prod_ID`) ON delete cascade on update cascade;
 
