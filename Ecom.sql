create database ecom;
use  ecom;	

/* Supplier Table*/ 
create table supplier 
( 
SUPP_ID int PRIMARY KEY AUTO_INCREMENT NOT NULL ,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50) NOT NULL,
SUPP_PHONE varchar(50)
);
INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY,SUPP_PHONE)
VALUES 
(1, 'Rajesh Retails' , 'Delhi ', '1234567890'),
(2, 'Appario Ltd. ' , 'Mumbai', '2589631470'),
(3, ' Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails' , 'Kochi', '8975463285'), 
(5, 'Mittal Ltd.' , 'Lucknow', '7898456532');
select * from supplier;



/* customer Table*/ 
create table customer
(
CUST_ID int  NOT NULL PRIMARY KEY AUTO_INCREMENT,
CUST_NAME varchar(20) NOT NULL,
CUST_PHONE varchar(10) NOT NULL,
CUST_CITY varchar(30) NOT NULL,
CUST_GEND char
);
INSERT INTO customer (CUST_ID, CUST_NAME, CUST_PHONE,CUST_CITY,CUST_GEND)
VALUES 
(1, 'AAKASH' ,'9999999999', 'DELHI' ,'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'), 
(5 ,'PULKIT', '7895999999', 'LUCKNOW', 'M');
select * from customer;


/* category Table*/ 
create table category
( 
CAT_ID int  NOT NULL PRIMARY KEY ,
CAT_NAME varchar(20) NOT NULL
);
INSERT INTO category (CAT_ID, CAT_NAME)
VALUES 
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONICS'), 
(5 ,'CLOTHES');
select * from category;
 

/* Product Table*/ 
create table product
( 
PROD_ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
PROD_NAME varchar(20) NOT NULL
DEFAULT
"Dummy",
PROD_DESC varchar(60) ,
CAT_ID int,
FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);
INSERT INTO product (PROD_ID, PROD_NAME, PROD_DESC,CAT_ID)
VALUES 
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1), 
(13, 'Shirt', 'Arrow Navy Blue Formal shirt', 5),
(14, 'Shampoo', 'Dove-Damage and Repair Shampoo', 3);
select * from product;



/* supplier pricing Table*/ 
create table supplier_pricing
( 
PRICING_ID  int NOT NULL PRIMARY KEY AUTO_INCREMENT,
PROD_ID  int ,
FOREIGN KEY (PROD_ID) REFERENCES product(PROD_ID),
SUPP_ID int,
FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID),
SUPP_PRICE INT DEFAULT 0
);
INSERT INTO supplier_pricing (PRICING_ID,PROD_ID,SUPP_ID,SUPP_PRICE)
VALUES 
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 11, 1, 249),
(7, 13, 3, 997),
(8, 12, 1, 239),
(9, 9, 2, 399),
(10, 14, 1, 180),
(11, 10, 3, 9899),
(12, 7, 5, 799),
(13, 8, 3, 1499),
(14, 6, 1, 49);
select * from supplier_pricing;  
  


/* order Table */   
create table orders
( 
ORDE_ID int  NOT NULL PRIMARY KEY AUTO_INCREMENT,
ORDE_AMOUNT int NOT NULL,
ORDE_DATE date NOT NULL,
CUST_ID int,
FOREIGN KEY (CUST_ID) REFERENCES customer(CUST_ID),
PRICING_ID int,
FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);
INSERT INTO orders (ORDE_ID, ORDE_AMOUNT, ORDE_DATE, CUST_ID, PRICING_ID)
VALUES 
(101, 1500,'2021-10-06', 2, 1),
(102, 1000, '2021-10-12', 3, 5),
(103, 30000, '2021-09-16', 5, 2),
(104, 1500, '2021-10-05', 1, 1),
(105, 3000, '2021-08-16', 4, 3),
(106, 1450, '2021-08-18', 1, 9),
(107, 789, '2021-09-01', 3, 7),
(108, 780, '2021-09-07', 5, 6),
(109, 3000, '2021-09-10', 5, 3),
(110, 2500, '2021-09-10', 2, 4),
(111, 1000, '2021-09-15', 4, 5),
(112, 789, '2021-09-16', 4, 7),
(113, 31000, '2021-09-16', 1, 8),
(114, 1000, '2021-09-16', 3, 5),
(115, 3000, '2021-09-16', 5, 3),
(116, 99, '2021-09-17', 2, 14);  
select * from orders;  




/* rating Table */    
create table rating
( 
RAT_ID int  NOT NULL PRIMARY KEY AUTO_INCREMENT,
ORDE_ID int,
FOREIGN KEY (ORDE_ID) REFERENCES orders(ORDE_ID),
RAT_RATSTARS int NOT NULL
);
INSERT INTO rating (RAT_ID, ORDE_ID, RAT_RATSTARS)
VALUES 
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);
select * from rating;  




/*(Q-3)Display the total number of customers based on gender who have placed orders of worth at least Rs.3000. */
select count(T2.CUST_GEND) as NoOfCustomers, T2.CUST_GEND from
(select T1.CUST_ID, T1.CUST_GEND, T1.CUST_NAME from
(select orders.*, customer.CUST_GEND, customer.CUST_NAME from orders inner join customer 
where orders.CUST_ID=customer.CUST_ID having
orders.ORDE_AMOUNT>=3000)
as T1 group by T1.CUST_ID) as T2 group by T2.CUST_GEND;



/*(Q-4) Display all the orders along with product name ordered by a customer having Customer_Id=2 */
select product.PROD_NAME, orders.* from orders, supplier_pricing, product where 
orders .CUST_ID=2 and orders .PRICING_ID=supplier_pricing.PRICING_ID and 
supplier_pricing.PROD_ID=product.PROD_ID;




/* (Q-5) Display the Supplier details who can supply more than one product. */
select supplier.* from supplier where supplier.SUPP_ID in 
(select SUPP_ID from supplier_pricing group by SUPP_ID having 
count(SUPP_ID)>1) group by supplier.SUPP_ID ;




/*(Q-6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product */
select category.CAT_ID,category.CAT_NAME, MIN(T3.MIN_PRICE) as 
MIN_PRICE from category inner join (select product.CAT_ID, 
product.PROD_NAME, T2.* from product inner join 
(select PROD_ID, MIN(SUPP_PRICE) as MIN_PRICE from supplier_pricing group by PROD_ID) 
as T2 where T2.PROD_ID = product.PROD_ID)
as T3 where T3.CAT_ID=category.CAT_ID 
group by T3.CAT_ID ORDER BY MIN_PRICE ASC;




/*(Q-7) Display the Id and Name of the Product ordered after “2021-10-05”.*/
select product.PROD_ID,product.PROD_NAME from
orders inner join supplier_pricing on  
supplier_pricing.PRICING_ID=orders.PRICING_ID 
inner join product on product.PROD_ID=supplier_pricing.PROD_ID
where orders.ORDE_DATE>'2021-10-05'; 




/*(Q-8) Display customer name and gender whose names start or end with character 'A'.*/
select customer.CUST_NAME,customer.CUST_GEND from 
customer where customer.CUST_NAME like 'A%'or customer.CUST_NAME like '%A';




/* (Q-9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent
Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”. */
DELIMITER &&
CREATE PROCEDURE PROC() 
BEGIN 
select report.SUPP_ID,report.SUPP_NAME,report.Average,
CASE 
WHEN report.Average = 5 THEN 'ExcellentService' 
WHEN report.Average > 4 THEN 'Good Service' 
WHEN report.Average >2 THEN 'Average Service' 
ELSE 'Poor Service' 
END AS Type_of_Service from 
(select final.SUPP_ID, supplier.SUPP_NAME, final.Average from 
(select TEST2.SUPP_ID, SUM(TEST2.RAT_RATSTARS)/COUNT(TEST2.RAT_RATSTARS) as Average from 
(select supplier_pricing.SUPP_ID, TEST.ORDE_ID, TEST.RAT_RATSTARS from supplier_pricing inner join 
(select orders.PRICING_ID, rating.ORDE_ID, rating.RAT_RATSTARS from orders inner join rating on rating.ORDE_ID = orders.ORDE_ID ) 
as TEST on TEST.PRICING_ID = supplier_pricing.PRICING_ID) 
as TEST2 group by supplier_pricing.SUPP_ID) 
as final inner join supplier where final.SUPP_ID = supplier.SUPP_ID) as report; 
END &&
DELIMITER ;
 
 
 


