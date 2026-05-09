-----------------------------------
**Creating Databases in Detail**
-----------------------------------

Every application starts with a **database**. Without one, we can’t store users, products, or orders.  
- Developers create databases to organize data logically.  
- Real-world use cases:  
  - A banking app has a database for accounts and transactions.  
  - An e-commerce site has a database for products, customers, and orders.  
- Problem solved: Instead of messy files, databases give structure, consistency, and speed.  

---

- **Database**: A container for tables, views, procedures, etc.  
- **Schema**: Logical structure of the database (tables, relationships).  
- **CREATE DATABASE**: Command to make a new database.  
- **USE**: Switch to a specific database.  
- **DROP DATABASE**: Delete a database (dangerous in production!).  

Execution behavior:  
- When you `CREATE DATABASE`, MySQL allocates space and metadata.  
- When you `USE`, MySQL sets that database as the default context.  
- Common mistakes:  
  - Forgetting to `USE` the database before creating tables.  
  - Accidentally dropping a database without backups.  

Performance note: Database creation itself is fast, but schema design impacts long-term performance.

---

### SUMMARY
- **CREATE DATABASE dbname;** → Make a new database.  
- **USE dbname;** → Switch to it.  
- **DROP DATABASE dbname;** → Delete it.  
- Always design schema before inserting data.  
- Interview tip: Difference between database and schema.  
- Mistake: Forgetting to select the database before queries.  

---

**Small example:**
```sql
CREATE DATABASE company;
USE company;
```

**Practical example:**
```sql
CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
);
```

**Realistic example:**
```sql
CREATE DATABASE bank;
USE bank;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    holder_name VARCHAR(50),
    balance DECIMAL(12,2)
);
```

---

**accounts table after inserting one row:**
```
+------------+-------------+----------+
| account_id | holder_name | balance  |
+------------+-------------+----------+
| 1          | Priya       | 5000.00  |
+------------+-------------+----------+
```

---

### THINKING QUESTIONS
- Why do we separate databases instead of putting everything in one giant table?  
- What happens if you forget to `USE` a database before creating a table?  
- Why is `DROP DATABASE` dangerous in production?  

---

### MEMORY BOOSTERS
- Think: **Database = Folder**, **Schema = Blueprint**, **Table = Excel sheet**.  
- Mnemonic: **CUD** → Create, Use, Drop.  

---


- Interview Q: “Difference between database and schema?”  
- Industry: Developers often manage multiple databases (e.g., one for users, one for logs).  
- Example: In microservices, each service may have its own database.
- MySQL stores database metadata in the **data dictionary**.  
- Dropping a database removes all tables, views, triggers, and stored procedures.  
- In production, databases are often backed up with **replication** or **dump files** before deletion.
