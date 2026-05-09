CREATE DATABASE company;
USE company;
CREATE TABLE product(
	product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0
);
CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT CHECK (quantity > 0),
    order_date DATE NOT NULL
);

