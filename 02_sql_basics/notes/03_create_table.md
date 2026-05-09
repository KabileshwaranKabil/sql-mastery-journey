-----------------------------------
**Chunk 3 — Creating Tables in Detail**
-----------------------------------

Tables are the **core building blocks** of a database.  
- Every piece of data (users, products, orders) lives inside a table.  
- Without well-designed tables, your database becomes messy, slow, and unreliable.  
- Real-world use cases:  
  - A `users` table stores login info.  
  - An `orders` table tracks purchases.  
  - A `payments` table records transactions.  

Tables are where **backend developers spend most of their time** — designing, querying, and maintaining them.

---

- **Table**: A structured grid of rows and columns.  
- **Column definition**: Each column has a **name** and a **data type** (e.g., `VARCHAR`, `INT`).  
- **Primary Key**: A unique identifier for each row (e.g., `id`).  
- **Constraints**: Rules applied to columns (e.g., `NOT NULL`, `UNIQUE`).  
- **CREATE TABLE**: Command to define a new table.  

Execution behavior:  
- MySQL checks column definitions and constraints before creating the table.  
- Common mistakes:  
  - Forgetting a primary key → leads to duplicate rows.  
  - Using wrong data types (e.g., storing prices in `INT` instead of `DECIMAL`).  
  - Naming tables/columns poorly (e.g., `data1`, `data2` instead of meaningful names).  

Performance note: Choosing correct data types (like `INT` vs `BIGINT`, `VARCHAR` vs `TEXT`) affects speed and storage.

---

### SUMMARY
- **CREATE TABLE table_name (...);** → Define a table.  
- **Column = name + data type + constraints.**  
- **Primary Key** = unique identifier.  
- **Constraints**: `NOT NULL`, `UNIQUE`, `DEFAULT`, `CHECK`.  
- **Naming rule**: Use clear, lowercase, plural names (`users`, `products`).  
- Mistake: Forgetting primary key or wrong data type.  

---

**Small example:**
```sql
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);
```

**Practical example:**
```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0
);
```

**Realistic example:**
```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT CHECK (quantity > 0),
    order_date DATE NOT NULL
);
```

---

### VISUALIZATION
**products table after inserting two rows:**
```
+------------+-----------+--------+-------+
| product_id | name      | price  | stock |
+------------+-----------+--------+-------+
| 1          | Laptop    | 1200.00| 10    |
| 2          | Headphones|  150.00| 25    |
+------------+-----------+--------+-------+
```

---

### THINKING QUESTIONS
- Why is a primary key necessary?  
- What happens if you don’t set `NOT NULL` on a column?  
- Why use `DECIMAL` instead of `FLOAT` for money?  

---


### MEMORY BOOSTERS
- Think: **Table = Excel sheet**.  
- Mnemonic: **PDC** → Primary key, Data types, Constraints.  

---


- Interview Q: “Why is a primary key important?”  
- Industry: Poor table design leads to duplicate users, broken orders, and financial errors.  
- Example: Amazon’s `orders` table must enforce constraints to prevent invalid purchases.  
- MySQL’s **InnoDB engine** automatically creates clustered indexes on primary keys.  
- Constraints are enforced at the storage engine level.  
- Poorly chosen data types can cause performance bottlenecks in large-scale systems.