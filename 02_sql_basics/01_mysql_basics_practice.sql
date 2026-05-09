/*
PRACTICE PROBLEMS 
1. Create a database called `company`.  
2. Create a table `employees` with columns: id, name, department.  
3. Insert 3 employees into the table.  
4. Write a query to fetch all employees.  
5. Imagine you’re building a small e-commerce app. Create a database `shop` and a table `products` with id, name, price. Insert 2 products.  
*/

-- Problem 01
CREATE DATABASE company;

-- Problem 02
USE company;
CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

-- Problem 03
INSERT INTO employee VALUES
(121,'Ganesh','Automobile'),
(432,'Abdul','Cooking'),
(439,'Ishwar','Cleaning');

-- Problem 04
SELECT * FROM employee;

-- Problem 05
CREATE DATABASE shop;
USE shop;
CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(8,2)
);
INSERT INTO product VALUES
(321,'Laptop',432100.43),
(101,'Electric Guitar',125000.43);