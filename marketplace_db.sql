DROP DATABASE IF EXISTS `virtualmart`;
CREATE DATABASE `virtualmart`;
USE `virtualmart`;

SET NAMES utf8;
SET character_set_client = utf8mb4;

CREATE TABLE users (
User_ID int NOT NULL AUTO_INCREMENT,
User_Name varchar(20) UNIQUE,
User_Pass varchar(30) NOT NULL,
First_Name varchar(30) NOT NULL, 
Last_Name varchar(30),
Gender varchar(10),
Email varchar(50) NOT NULL,
Phone_Number int UNIQUE,
Created_Timestamp datetime default current_timestamp(),
State int,
PRIMARY KEY (User_ID)) AUTO_INCREMENT = 3;

INSERT INTO users VALUES(1,'root','superuser111','root','root','null','raghu991k@gmail.com',0000000000,current_timestamp(),1),
						(2,'Admin','Admin111','Admin','Admin','null','surya.munuganti@gmail.com',1111111111,current_timestamp(),1);

CREATE TABLE location (
Loc_ID int ,
Loc_Name varchar(20) NOT NULL,
Loc_Code  varchar(5) NOT NULL,
PRIMARY KEY (Loc_ID)
);

INSERT INTO location VALUES (1, 'Montreal', 'mtl'),
							(2, 'Laval','lav');

CREATE TABLE category (
Category_ID int,
Category_Name varchar(30) NOT NULL,
PRIMARY KEY (Category_ID)
);

INSERT INTO category VALUES(1,'automobiles bikes'),
							(2,'electronics'),
							(3,'real estate'),
							(4,'furniture'),
							(5,'books'),
							(6,'others');
                                                        
CREATE TABLE item_condition_type (
Item_Condition_ID int,
Item_Condition_Type varchar(20) NOT NULL,
PRIMARY KEY (Item_Condition_ID)
);

INSERT INTO item_condition_type VALUES (1, 'New'),
										(2, 'Used');

CREATE TABLE ads_posted (
Prod_ID int AUTO_INCREMENT,
Prod_Name varchar(50) NOT NULL,
Prod_Description varchar(255),
Prod_Price int NOT NULL,
Loc_ID int,
Category_Name varchar(30) NOT NULL,
Sub_Category_Name varchar(30) NOT NULL,
User_ID int , 
Item_Condition_ID int,
Posted_Timestamp datetime default current_timestamp(),
Availability varchar(20),
Upd_Del varchar(20),
image_path varchar(1024),
PRIMARY KEY (Prod_ID),
FOREIGN KEY (User_ID) REFERENCES users(User_ID),
FOREIGN KEY (Item_Condition_ID) REFERENCES item_condition_type(Item_Condition_ID),
FOREIGN KEY (Loc_ID) REFERENCES location(Loc_ID)
) AUTO_INCREMENT = 1;

CREATE TABLE automobile_bikes (
Prod_ID int NOT NULL,
Category_ID int default 1,
Make varchar(20),
Model varchar(20),
Color varchar(20),
Vehicle_Type varchar(20),
Kilometers int,
`No Of Owners` int,
FOREIGN KEY (Prod_ID) REFERENCES ads_posted(Prod_ID),
FOREIGN KEY (Category_ID) REFERENCES category(Category_ID)
);

CREATE TABLE electronics (
Prod_ID int NOT NULL,
Category_ID int default 2,
Laptop varchar(5),
Television varchar(5),
Mobile varchar(5),
Computer varchar(5),
`Computer Accessories` varchar(5),
Other varchar(5),
FOREIGN KEY (Prod_ID) REFERENCES ads_posted(Prod_ID),
FOREIGN KEY (Category_ID) REFERENCES category(Category_ID)
);

CREATE TABLE furniture (
Prod_ID int NOT NULL,
Category_ID int default 3,
Chair varchar(5),
`Table` varchar(5),
Desk varchar(5),
Bed varchar(5),
Other varchar(5),
FOREIGN KEY (Prod_ID) REFERENCES ads_posted(Prod_ID),
FOREIGN KEY (Category_ID) REFERENCES category(Category_ID)
);

CREATE TABLE real_estate (
Prod_ID int NOT NULL,
Category_ID int default 4,
`Short Term Rent` varchar(5),
`Long Term Rent` varchar(5),
`House for sale` varchar(5),
FOREIGN KEY (Prod_ID) REFERENCES ads_posted(Prod_ID),
FOREIGN KEY (Category_ID) REFERENCES category(Category_ID)
);

CREATE TABLE books (
Prod_ID int NOT NULL,
Category_ID int default 5,
Textbooks varchar(5),
Magazines varchar(5),
Comics varchar(5),
Other varchar(5),
FOREIGN KEY (Prod_ID) REFERENCES ads_posted(Prod_ID),
FOREIGN KEY (Category_ID) REFERENCES category(Category_ID)
);

CREATE TABLE user_search (
Search_ID int AUTO_INCREMENT,
Search_Name varchar(100) NOT NULL,
Category_ID int,
Sub_Category_ID int,
Item_Condition_Type varchar(30),
PRIMARY KEY (Search_ID),
FOREIGN KEY (Category_ID) REFERENCES category(Category_ID)
) AUTO_INCREMENT = 1;

