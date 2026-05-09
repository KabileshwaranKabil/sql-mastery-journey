-----------------------------------
**Data Types in MySQL**
-----------------------------------

Choosing the right **data type** is one of the most important decisions in database design.  
- Wrong data types = wasted space, slower queries, and bugs.  
- Example: Storing money in `FLOAT` can cause rounding errors → financial disasters.  
- Real-world use cases:  
  - `INT` for IDs.  
  - `VARCHAR` for names/emails.  
  - `DATE` for birthdays.  
  - `DECIMAL` for prices.  

---

- **Numeric types**: `INT`, `BIGINT`, `DECIMAL`, `FLOAT`, `DOUBLE`.  
- **String types**: `CHAR`, `VARCHAR`, `TEXT`.  
- **Date/Time types**: `DATE`, `DATETIME`, `TIMESTAMP`.  
- **Boolean**: `BOOLEAN` (internally stored as `TINYINT(1)`).  

Execution behavior:  
- MySQL allocates storage based on type.  
- Choosing smaller types saves space but may limit range.  
- Common mistakes:  
  - Using `FLOAT` for money (rounding errors).  
  - Using `TEXT` when `VARCHAR` is enough (performance hit).  
  - Forgetting time zones with `TIMESTAMP`.  

Performance note: Proper data types = faster queries, smaller indexes, better scalability.

Data types decide **how your data is stored, validated, and optimized**.  
- Wrong choice → wasted space, slow queries, or even wrong results.  
- Correct choice → efficient, reliable, scalable systems.  
Every backend developer must master this because **data types are the foundation of schema design**.


| Category       | Common Types       | Usage Example | Notes / Industry Tips |
|----------------|-------------------|---------------|------------------------|
| **Numeric**    | `INT`, `BIGINT`, `DECIMAL(p,s)`, `FLOAT`, `DOUBLE` | IDs, counts, prices | Use `DECIMAL` for money (precise). `INT` for IDs. Avoid `FLOAT` for currency. |
| **String/Text**| `CHAR(n)`, `VARCHAR(n)`, `TEXT` | Names, emails, descriptions | `VARCHAR` is flexible. `CHAR` is fixed length (rare). `TEXT` for long content (blogs). |
| **Date/Time**  | `DATE`, `DATETIME`, `TIMESTAMP`, `TIME`, `YEAR` | Birthdays, order dates, logs | `TIMESTAMP` auto-tracks changes. `DATETIME` for full date+time. |
| **Boolean**    | `BOOLEAN` (alias for `TINYINT(1)`) | Flags like is_active | Stored as 0/1 internally. |
| **Binary**     | `BLOB`, `VARBINARY` | Images, files | Usually avoided in modern apps (store files in cloud, keep metadata in DB). |
| **JSON**       | `JSON` | Flexible semi-structured data | Useful for modern apps needing dynamic fields. |

---

### SUMMARY
- **Numeric**: `INT` for IDs, `DECIMAL` for money.  
- **String**: `VARCHAR` for variable text, `TEXT` for long text.  
- **Date/Time**: `DATE`, `DATETIME`, `TIMESTAMP`.  
- **Boolean**: Stored as `TINYINT(1)` (0/1).  
- **JSON**: Modern flexible storage.  
- **Mistakes**: Using `FLOAT` for money, `TEXT` when `VARCHAR` is enough.  

```sql
-- Numeric
CREATE TABLE accounts (
    id INT PRIMARY KEY,
    balance DECIMAL(12,2) NOT NULL
);

-- String
CREATE TABLE users (
    id INT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Date/Time
CREATE TABLE orders (
    id INT PRIMARY KEY,
    order_date DATETIME NOT NULL
);

-- Boolean
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE
);

-- JSON
CREATE TABLE settings (
    id INT PRIMARY KEY,
    preferences JSON
);
```

---

Example `users` table:

```
+----+----------------------+
| id | email                |
+----+----------------------+
| 1  | alex@example.com     |
| 2  | priya@example.com    |
+----+----------------------+
```

---

### THINKING QUESTIONS
- Why is `DECIMAL` better than `FLOAT` for money?  
- When would you use `TEXT` instead of `VARCHAR`?  
- Why might JSON columns be useful in modern apps?  

---

- **Money loves DECIMAL.**  
- **VARCHAR = flexible text. TEXT = long text.**  
- **TIMESTAMP = auto-track changes.** 
- Interview Q: “Why not use FLOAT for money?”  
- Industry: Choosing wrong types leads to bugs (e.g., rounding errors in payments).  
- Example: Amazon uses `DECIMAL` for prices to avoid financial inconsistencies.  
