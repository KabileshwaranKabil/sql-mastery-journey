-----------------------------------
**CRUD Operations (Insert, Select, Update, Delete)**
-----------------------------------

CRUD = **Create, Read, Update, Delete**.  
- These are the **four essential operations** every backend developer uses daily.  
- Real-world use cases:  
  - Create → Add a new user.  
  - Read → Fetch products for display.  
  - Update → Change an order status.  
  - Delete → Remove a canceled booking.  

Without CRUD, your database is just a static file — CRUD makes it **dynamic and interactive**.


- **INSERT** → Add new rows.  
- **SELECT** → Retrieve rows.  
- **UPDATE** → Modify existing rows.  
- **DELETE** → Remove rows.  

Execution behavior:  
- MySQL checks constraints before inserting/updating.  
- `UPDATE` and `DELETE` can affect multiple rows if not filtered carefully.  
- Common mistakes:  
  - Forgetting `WHERE` in `UPDATE`/`DELETE` → modifies/deletes all rows.  
  - Using wrong data types in `INSERT`.  
  - Using `SELECT *` too often (bad for performance in large apps).  


### SUMMARY
- **INSERT INTO table VALUES (...);** → Add data.  
- **SELECT columns FROM table;** → Read data.  
- **UPDATE table SET column=value WHERE condition;** → Modify data.  
- **DELETE FROM table WHERE condition;** → Remove data.  
- **Golden Rule**: Always use `WHERE` for `UPDATE` and `DELETE`.  

---

**INSERT**
```sql
INSERT INTO students VALUES (1, 'Alex', '2005-06-15');
```

**SELECT**
```sql
SELECT name, birth_date FROM students;
```

**UPDATE**
```sql
UPDATE students
SET name = 'Alexander'
WHERE id = 1;
```

**DELETE**
```sql
DELETE FROM students
WHERE id = 1;
```

---

**students table before update:**
```
+----+-------+------------+
| id | name  | birth_date |
+----+-------+------------+
| 1  | Alex  | 2005-06-15 |
+----+-------+------------+
```

**students table after update:**
```
+----+-----------+------------+
| id | name      | birth_date |
+----+-----------+------------+
| 1  | Alexander | 2005-06-15 |
+----+-----------+------------+
```

---

### THINKING QUESTIONS
- What happens if you run `DELETE FROM students;` without `WHERE`?  
- Why is `SELECT *` discouraged in production?  
- How does MySQL know which row to update when multiple rows match?  

---


### MEMORY BOOSTERS
- CRUD = **Create, Read, Update, Delete**.  
- Mnemonic: **I S U D** → Insert, Select, Update, Delete.  
- Rule: *Never UPDATE/DELETE without WHERE.*  

---

- Interview Q: “Explain CRUD operations with examples.”  
- Industry: APIs map directly to CRUD (POST = Create, GET = Read, PUT/PATCH = Update, DELETE = Delete).  
- Example: When you buy something on Amazon, CRUD operations happen behind the scenes.
- MySQL uses **transaction logs** to record CRUD changes.  
- `DELETE` doesn’t always free space immediately — it marks rows for removal.  
- `UPDATE` can trigger locks depending on isolation level.


-----------------------------------
**NULL and Handling Missing Data**
-----------------------------------

In real-world databases, not all information is always available.  
- A student may not have an email yet.  
- A product may not have a discount assigned.  
- An employee record may be missing a phone number.  

That’s where **NULL** comes in. It represents **missing or unknown values**.  
If you don’t understand NULL, you’ll misinterpret queries, get wrong results, or even break your application logic.

- **NULL** = “no value” or “unknown.” It’s not zero, not empty string, not false.  
- **IS NULL / IS NOT NULL** → Used to check for missing values.  
- **Default behavior**: If you don’t insert a value into a column that allows NULL, MySQL stores NULL.  
- **Constraints**: `NOT NULL` prevents missing values.  
- **Execution behavior**: Comparisons with NULL (`=`, `!=`) don’t work. You must use `IS NULL`.  

Common mistakes:  
- Thinking `NULL = 0` or `NULL = ''`.  
- Forgetting to handle NULL in queries → leads to wrong results.  
- Allowing too many NULLs → messy schema design.  

Performance note: Too many NULLs can complicate indexing and query optimization.

---

### SUMMARY
- **NULL** = missing/unknown value.  
- **NOT NULL** = column must always have a value.  
- **Check NULL** → `IS NULL` / `IS NOT NULL`.  
- **Mistake**: Using `= NULL` instead of `IS NULL`.  
- **Tip**: Use defaults to avoid unnecessary NULLs.  

---

**Allowing NULLs:**
```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) -- can be NULL
);

INSERT INTO employees (id, name) VALUES (1, 'Alex');
```
Here, `phone` will be NULL because no value was given.

**Checking NULLs:**
```sql
SELECT * FROM employees
WHERE phone IS NULL;
```

**Preventing NULLs:**
```sql
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);
```

---

**employees table:**
```
+----+-------+---------+
| id | name  | phone   |
+----+-------+---------+
| 1  | Alex  | NULL    |
| 2  | Priya | 555-123 |
+----+-------+---------+
```

---

### THINKING QUESTIONS
- Why is `NULL` different from `0` or empty string?  
- What happens if you forget to handle NULL in a query?  
- Should every column allow NULLs? Why or why not?  

---

### MEMORY BOOSTERS
- **NULL ≠ 0, NULL ≠ ''**.  
- Mnemonic: **N.U.L.L. = Not Useful Logical Literal** (reminds you it’s special).  

---

- Interview Q: “Difference between NULL and empty string?”  
- Industry: APIs often return NULL for missing fields.  
- Example: In e-commerce, `shipped_date` is NULL until the order is shipped.
- NULLs complicate indexing: indexes skip NULLs unless explicitly included.  
- Aggregate functions (`COUNT`, `SUM`) ignore NULLs.  
- Joins with NULLs can behave unexpectedly if not handled.  
