/*
PRACTICE PROBLEMS
1. Create a table `employees` with id, name, department.  
2. Create a table `payments` with id, user_id, amount, payment_date.  
   - Ensure `amount` cannot be negative.
3. Create a table `inventory` with id, product_name, quantity, and price.  
   - Add a rule that `quantity` must be ≥ 0.  
*/
-- Problem 01
CREATE DATABASE problems;
USE problems;
CREATE TABLE employees(
	id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL
);

-- Problem 02
CREATE TABLE payments(
	id INT PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10,2) CHECK (amount > 0),
    payment_date DATE NOT NULL
);

-- Problem 03
CREATE TABLE inventory(
	id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
	quantity INT CHECK (quantity >= 0),
    price DECIMAL(10,2) NOT NULL
);
