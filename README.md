# 🍕 Pizza Sales Analysis (SQL Project)

![SQL](https://img.shields.io/badge/Language-SQL-blue?style=for-the-badge)
![Database](https://img.shields.io/badge/Database-MySQL-success?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

---

## 📘 Overview

The **Pizza Sales Analysis** project uses SQL to explore and analyze sales data from a pizza restaurant.  
The goal is to derive actionable business insights — such as revenue trends, top-performing pizzas, and customer ordering patterns — using structured queries and relational joins.

This project demonstrates **real-world SQL analytics** involving aggregations, joins, and window functions.

---

## 🗃️ Database Schema

The analysis is based on a relational database named **`pizzahut`** consisting of four key tables:

### **1. `orders`**
| Column | Type | Description |
|--------|------|-------------|
| `order_id` | INT | Unique order identifier |
| `order_date` | DATE | Date of the order |
| `order_time` | TIME | Time when the order was placed |

### **2. `orders_details`**
| Column | Type | Description |
|--------|------|-------------|
| `order_details_id` | INT | Unique order detail identifier |
| `order_id` | INT | References the related order |
| `pizza_id` | TEXT | References the pizza ordered |
| `quantity` | INT | Quantity of pizzas ordered |

### **3. `pizzas`**
| Column | Type | Description |
|--------|------|-------------|
| `pizza_id` | TEXT | Unique pizza identifier |
| `pizza_type_id` | TEXT | Links to `pizza_types` |
| `size` | TEXT | Pizza size (S, M, L, XL) |
| `price` | DECIMAL | Price of the pizza |

### **4. `pizza_types`**
| Column | Type | Description |
|--------|------|-------------|
| `pizza_type_id` | TEXT | Unique pizza type identifier |
| `name` | TEXT | Name of the pizza |
| `category` | TEXT | Pizza category (Classic, Veggie, Supreme, etc.) |

---

## 🧮 Key Analyses & Queries

| Analysis | Description |
|-----------|--------------|
| **Total Orders** | Counts total number of orders placed |
| **Total Revenue** | Calculates total sales revenue |
| **Highest Priced Pizza** | Finds the most expensive pizza |
| **Most Ordered Size** | Determines the most popular pizza size |
| **Top Pizza Types** | Lists pizzas with the highest quantities sold |
| **Top Categories** | Shows categories ordered most frequently |
| **Orders by Hour** | Analyzes order distribution by hour of day |
| **Daily Orders & Average** | Displays total and average daily orders |
| **Top Revenue Pizzas** | Identifies pizzas generating highest revenue |
| **Category Revenue Share** | Calculates category-wise contribution to total revenue |
| **Cumulative Revenue** | Tracks revenue growth over time |
| **Top Pizza per Category** | Finds best-selling pizza in each category using window functions |

---

## ⚙️ SQL Concepts Demonstrated

- **Data Aggregation** (`SUM`, `COUNT`, `AVG`, `ROUND`)
- **Joins** (`INNER JOIN`, multi-table joins)
- **Grouping and Sorting** (`GROUP BY`, `ORDER BY`)
- **Subqueries** and **Derived Tables**
- **Window Functions** (`RANK()`, `OVER(PARTITION BY ...)`)
- **Date and Time Functions** (`HOUR()`, `DATE()`)

---

## 📈 Business Insights Gained

- 📦 **Total Revenue** and **Total Orders** over the sales period  
- 🏆 **Best-Selling Pizzas** and **Top Categories** by revenue and volume  
- ⏰ **Peak Order Hours** — to optimize staffing and delivery readiness  
- 💰 **Revenue Growth Trends** over time  
- 🍽️ **Customer Preferences** by pizza size and type  

---

## 🧰 How to Use

1. Import the SQL file into your MySQL or PostgreSQL database environment.  
2. Ensure the required tables (`orders`, `orders_details`, `pizzas`, `pizza_types`) are created and populated.  
3. Run each query sequentially to generate analytical insights.  

---

## 🧠 Learning Outcomes

- Applied **SQL for business analytics**
- Learned to build **data relationships** using joins
- Practiced **query optimization and structuring**
- Gained experience with **window functions and subqueries**

---

## 📎 Example Insights (Sample Results)

| Metric | Value |
|--------|-------:|
| Total Orders | 21,350 |
| Total Revenue | \$817,860.75 |
| Most Popular Size | Large (L) |
| Top Category by Revenue | Classic |
| Best-Selling Pizza | The Barbecue Chicken |

*(Note: Sample values for illustration only.)*

---

## 👨‍💻 Author

**Developed by:** *RAVINDRA KUMAR NAYAK*  
**Purpose:** SQL Portfolio / Data Analytics Project  
**Tools:** MySQL Workbench, DBeaver, or any SQL-compatible IDE  

---

## 🪪 License

This project is licensed under the **MIT License**.  
You are free to use, modify, and share this work with proper attribution.

---

> 💡 *“Data is the new oil, and SQL is the refinery.”*
