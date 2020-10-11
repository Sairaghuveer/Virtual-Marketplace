DROP DATABASE IF EXISTS `virtualmart`;
CREATE DATABASE `virtualmart`;
USE `virtualmart`;

SET NAMES utf8;
SET character_set_client = utf8mb4;

/* Users table to store users data where Active_State = 1 denotes the user is active in the system*/

CREATE TABLE users (
User_ID int AUTO_INCREMENT,
User_Name varchar(20) UNIQUE,
User_Pass varchar(30) NOT NULL,
First_Name varchar(30) NOT NULL, 
Last_Name varchar(30) NOT NULL,
Gender varchar(10) default NULL,
Email varchar(50) NOT NULL,
Phone_Number bigint(12) UNIQUE,
Created_Timestamp datetime default current_timestamp(),
Active_State int default 1,
PRIMARY KEY (User_ID)) AUTO_INCREMENT = 3;

INSERT INTO users VALUES(1,'root','superuser111','root','root','null','raghu991k@gmail.com',2222222222,current_timestamp(),1),
						(2,'Admin','Admin111','Admin','Admin','null','surya.munuganti@gmail.com',1111111111,current_timestamp(),1);

/*A location table to store the location ID's, name and codes where ID is used to uniquely idnetify the locatioon, and codes can also be used for that as it is unique*/

CREATE TABLE location (
Loc_ID int ,
Loc_Name varchar(20) NOT NULL,
Loc_Code  varchar(5) UNIQUE,
PRIMARY KEY (Loc_ID)
);

INSERT INTO location VALUES (1, 'Montreal', 'mtl'),
							(2, 'Laval','lav');

/*A category table to store the different categories in the table*/

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
                                                        
/*To specify the item condition which is helpful for the customers to filter products based on their needs*/

CREATE TABLE item_condition_type (
Item_Condition_ID int,
Item_Condition_Type varchar(20) NOT NULL,
PRIMARY KEY (Item_Condition_ID)
);

INSERT INTO item_condition_type VALUES (1, 'New'),
										(2, 'Used');

/*A table to store all the ads posted by a seller which is a pool of ads available where user ID indicated the ID of the seller
Availability defines whether the product is available or sold out, and Upd_Del field specifies if there were any updations or deltions performed
and image path specifies the path of the image stored in the directory*/

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
Availability varchar(20) default 'available',
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

/* A user searcgh table which specifies the search done by users in the application*/

CREATE TABLE user_search (
Search_ID int AUTO_INCREMENT,
Search_Name varchar(100) NOT NULL,
Category_ID int,
Sub_Category_ID int,
Item_Condition_Type varchar(30),
PRIMARY KEY (Search_ID),
FOREIGN KEY (Category_ID) REFERENCES category(Category_ID)
) AUTO_INCREMENT = 1;

/*A table to store all the messages between the potential buyer and seller starting with message ID 101*/

CREATE TABLE messages (
Buyer_ID int NOT NULL,
Seller_ID int NOT NULL,
Prod_ID int NOT NULL,
Message_ID int NOT NULL,
MSG_Timestamp datetime default current_timestamp(),
Buyer_MSG varchar(1024) NOT NULL,
Seller_MSG varchar(1024) NOT NULL,
PRIMARY KEY (Message_ID),
FOREIGN KEY (Buyer_ID) REFERENCES users(User_ID),
FOREIGN KEY (Prod_ID) REFERENCES ads_posted(Prod_ID),
FOREIGN KEY (Seller_ID) REFERENCES users(User_ID)
) AUTO_INCREMENT = 101;


