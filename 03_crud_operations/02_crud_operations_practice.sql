/*
PRACTICE PROBLEMS
1. Insert 2 new students into your `students` table.
2. Update one student’s name.  
3. Delete one student by id.
4. In the `products` table, insert 2 products, update one product’s price, and delete one product.  
*/

-- Problem 01
INSERT INTO students VALUES
(101,'Kabileshwaran',23),
(430,'Dhanush',20);

-- Problem 02
UPDATE students
SET name = 'Dhanushkhan'
WHERE id = 430;

-- Problem 03
DELETE FROM students
WHERE id = 101;

-- Problem 04
INSERT INTO products VALUES
(101,'ball point pen',50.32),
(103,'square rule book',120.21);

UPDATE products
SET price = 60.32
WHERE product_id = 101;

DELETE FROM products
WHERE product_id = 103;