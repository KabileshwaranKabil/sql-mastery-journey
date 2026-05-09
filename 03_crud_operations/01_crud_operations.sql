-- Insert to table

-- INSERT INTO TABLE_NAME VALUES(VALUES);
INSERT INTO students VALUE(1,'alex','2005-06-15');

-- Retrieve table 
-- SELECT col1, col2 FROM TABLE_NAME;
-- SELECT * FROM TABLE_NAME; 
SELECT name, birth_date FROM students;

-- Update
UPDATE students
SET name = 'Alexander'
WHERE id = 1;

-- Delete 
DELETE FROM students
WHERE id = 1;

