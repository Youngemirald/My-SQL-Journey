-- -- ASSIGNMENT
-- -- 1. Create a new database and switch to it.
-- -- 2. ⁠Create the Products, Customers, and Transactions tables.
-- -- 3. ⁠Insert at least 3 products and 3 customers.
-- -- 4. ⁠Update the price of one of the products.

-- -- 1. Create a new database and switch to it.
-- create database Eze_ltd;
use Eze_ltd;

-- -- 2. ⁠Create the Products, Customers, and Transactions tables.
-- Create Table Products (
-- Product_ID INT primary key,
-- product_Name varchar(20),
-- Product_Category varchar(20),
-- Product_Price INT
-- );

--  Create Table Customers (
-- Customer_ID INT primary key,
-- Customer_Name varchar(50),
-- Email varchar(50)
-- );

--  CREATE TABLE Transactions (
--   TransactionID INT PRIMARY KEY,
--   Customer_ID INT,
--   Product_ID INT,
--   Quantity INT,
--   FOREIGN KEY (Customer_ID) 
-- REFERENCES 
-- Customers(Customer_ID),
--   FOREIGN KEY (Product_ID) 
-- REFERENCES Products(Product_ID)
--  );
--  
-- -- 3. ⁠Insert at least 3 products and 3 customers.
-- insert into Products (Product_ID, Product_Name, Product_Category, Product_Price) value
-- (1, 'Hisense', 'Electronics', 350),
-- (2, 'Power Cable', 'Accessories', 15),
-- (3, 'TV Console', 'Furnitures', 150);

-- insert into Customers (Customer_ID, Customer_Name, Email) value
-- (1, 'Allien Smith', 'Alliensmith@google.com'),
-- (2, 'Sunday More', 'Sundaymore@yahoo.com'),
-- (3, 'Wood Walker', 'Woodwalker@gmail.com');

--  -- 4. ⁠Update the price of one of the products.
-- Update Products
-- Set Product_Price = 20
-- where Product_ID = 2;

-- select *
-- From Products;

--select *
-- from Customers;

-- select *
-- from Transactions;
