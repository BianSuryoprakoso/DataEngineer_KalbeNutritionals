-- Challenge Number 4
-- Create New Database (KALBE)
create database KALBE

-- Create Table Inventory
create table Inventory(
	Item_code int not null,
	Item_name varchar(50) not null,
	Item_price int not null,
	Item_total int not null,
	constraint PK_Inventory primary key (Item_code)
)

-- Insert Values to Table Inventory
insert into Inventory (Item_code, Item_name, Item_price, Item_total)
values (2341, 'Promag Tablet', 3000, 100),
	   (2342, 'Hydro Coco 250ML', 7000, 10),
	   (2343, 'Nutrive Benecol 100ML', 20000, 30),
	   (2344, 'Blackmores Vit C 500Mg', 95000, 45),
	   (2345, 'Entrasol Gold 370G', 90000, 120)
	   
-- Show Item_name that has the highest number in Item_total
select Item_name
from Inventory
where Item_total = (select max(Item_total) from inventory)

--  Update the Item_price of the output of question bullet
update Inventory
set Item_price = 8000
where Item_name = 'Entrasol Gold 370G'

-- What will happen if we insert another Item_name with Item_code of 2343 into the table? 
insert into Inventory (Item_code, Item_name, Item_price, Item_total)
values (2343, 'Obat Dummy', 1000, 1)

-- Delete the Item_name that has the lowest number of Item_total
DELETE FROM Inventory WHERE Item_total=(SELECT MIN(Item_total) FROM Inventory)




-- Challenge Number 5
create table customer_orders(
	order_no int not null,
	purchase_amount int not null,
	order_date date not null,
	customer_id int not null,
	salesman_id int not null,
	constraint PK_customer_orders primary key (order_no)
)

insert into customer_orders (order_no, purchase_amount, order_date, customer_id, salesman_id)
values (10001, 150, '2022-10-05', 2005, 3002),
	   (10009, 279, '2022-09-10', 2001, 3005),
	   (10002, 65, '2022-10-05', 2002, 3001),
	   (10004, 110, '2022-08-17', 2009, 3003),
	   (10007, 948, '2022-09-10', 2005, 3002),
	   (10005, 2400, '2022-07-27', 2007, 3001)
	   
-- Query for showing the results number 5 
select *
from customer_orders
where purchase_amount < 100 or (order_date >= '2022-08-25' and customer_id > 2001)	   

select * from customer_orders


-- 7 Star Scheme
-- Tabel Customer (Dimension)
CREATE Table Customer(
	Customer_ID int not null,
	CustomerName varchar (50) not null,
	Age int not null,
	Gender varchar (50) not null,
	Occupation varchar (50) not null,
	constraint PK_Customer primary key (Customer_ID)
)

-- Tabel Store (Dimension)
CREATE Table Store(
	Store_ID int not null,
	Store_code varchar (50) not null,
	Store_name varchar (50) not null,
	City varchar (50) not null,
	Region varchar (50) not null,
	constraint PK_Store primary key (Store_ID)
)

-- Tabel Promotion (Dimension)
CREATE Table Promotion(
	Promotion_ID int not null,
	Promotion_name varchar (50) not null,
	Start_date date not null,
	End_date date not null,
	Discount_rate float not null,
	constraint PK_Promotion primary key (Promotion_ID)
)

-- Tabel Date (Dimension)
CREATE Table Dates(
	Date_ID int not null,
	Date date not null,
	Year int not null,
	Month int not null,
	Day int not null,
	Quarter int not null,
	Holiday varchar (50) not null,
	constraint PK_Dates primary key (Date_ID)
)

-- Tabel Item (Dimension)
CREATE Table Item(
	Item_ID int not null,
	Item_code varchar (50) not null,
	Item_name varchar (50) not null,
	Item_price int not null,
	constraint PK_Item primary key (Item_ID)
)

-- Tabel Sales (Fact)
CREATE Table Sales(
	Sales_ID int not null,
	Date_ID int not null,
	Item_ID int not null,
	Store_ID int not null,
	Customer_ID int not null,
	Promotion_ID int not null,
	Discount float not null,
	Quantity_sold int not null,
	Revenue int not null,
	constraint PK_Sales primary key (Sales_ID),
	constraint FK_SalesD foreign key (Date_ID) references Dates (Date_ID),
	constraint FK_SalesI foreign key (Item_ID) references Item (Item_ID),
	constraint FK_SalesSt foreign key (Store_ID) references Store (Store_ID),
	constraint FK_SalesC foreign key (Customer_ID) references Customer (Customer_ID),
	constraint FK_SalesP foreign key (Promotion_ID) references Promotion (Promotion_ID)
)




