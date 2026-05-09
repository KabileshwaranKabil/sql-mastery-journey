-- Create a database
CREATE DATABASE school;

-- Use the database
USE school;

-- Create a table
CREATE TABLE students(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

-- Insert data
INSERT INTO students VALUES(38,"Kabileshwaran",23);

-- Retrieve data 
SELECT * FROM students;

-- Show all databases
SHOW DATABASES;

-- Delete a database
DROP DATABASE company;
DROP DATABASE IF EXISTS school;
