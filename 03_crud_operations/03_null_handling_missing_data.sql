/*
PRACTICE PROBLEMS
1. Create a table `students` with id, name, email (nullable). Insert one student without email.  
2. Write a query to find all students with missing emails.  
3. Create a table `orders` with id, product_id, shipped_date (nullable). Insert one order without shipped_date. Write a query to find all unshipped orders.  
*/

-- Problem 01
CREATE TABLE students(
	id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE
);
INSERT INTO students(id,name) VALUES
(101,'Kabil');

-- Problem 02
SELECT * FROM students WHERE email IS NULL;


-- Problem 03
CREATE TABLE orders(
	id INT PRIMARY KEY,
    product_id INT NOT NULL,
    shipped_date DATE
);
INSERT INTO orders(id,product_id) VALUES(101,32);
SELECT * FROM orders WHERE shipped_date IS NULL;
