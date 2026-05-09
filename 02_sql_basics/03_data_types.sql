/*
PRACTICE PROBLEMS
1. Create a table `students` with id, name, birth_date.  
2. Create a table `products` with id, name, price (use correct type), and is_active flag.  
3. Create a table `logs` with id, user_id, action (string), and timestamp.  
*/
CREATE TABLE students(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL
);

CREATE TABLE products(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);
CREATE TABLE logs(
	id INT PRIMARY KEY,
    user_id INT  NOT NULL,
    action VARCHAR(100),
    log_time DATETIME NOT NULL
);