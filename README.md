# Retail Business Inteligence 🕴️
### An end-to-end data solution transforming raw retail transaction logs into actionable business intelligence.
## 🏗️ Part 1: SQL & Data Modeling (The Foundation)
## Table selection and strategy
I organized the data into Fact and Dimension tables to ensure data integrity and query efficiency:

1.1. Fact Tables (Quantitative): Fact_Sales

| Column name | Type | Description |
| :--- | :--- | :--- |
| order_id | Character varying | Primary key | 
| date_id | Date | Key special for the calendar |
| customer_id | Character varying | Customers who buy something | 
| product_id | Integer | ID for every product |
| quantity | Integer | Number of elements per each order_id | 
| unit_price | Numeric (10,2) | Price per each product  |
| discount amount | Numeric (10,2) | Each discount per product | 
| total_amount | Numeric (10,2) | Amount obtain after the accountability |
| delivery_time_days | Integer | Quantity of days since the finished product until the customer reception | 
| customer_rating | Integer | Enjoyment of each customer based on an interval 1-5 |
| session_duration_minute | Integer | Verify the job of each employee| 
| pages_viewed_website | Integer | Quantity per customer upon clicking |

1.2. Dimension Tables (These provide the context of each area) : dim_date

| Column name | Type |
| :--- | :--- |
| date_id | Character varying | 
| year | Integer | 
| month | Integer |
| month_name | Character varying |
| quarter | Integer | 
| day | Integer | 
| is_weekend | Boolean |
| week_of_year | Integer |

1.3. Dimension Tables (These provide the context of each area) : dim_products

| Column name | Type |
| :--- | :--- |
| product_id | Integer | 
| product_category | Character varying | 

1.4. Dimension Tables (These provide the context of each area) : dim_customers

| Column name | Type |
| :--- | :--- |
| customer_id | Character varying | 
| age | Integer | 
| gender | Character varying |
| city | Character varying |
| is_returning_customer | Booleab | 
| first_order_date | Date | 
| last_order_date | Date |
| total_orders | Integer |
| total_spent_dollars | Numeric (10,2) |

## Querys SQL by PostgreSQL 💻

### Query 1:
* Crack de los 3 postes
### Query 2:

### Query 3:

### Query 4:

### Query 5:

### Query 6:

### Query 7:

### Query 8:

### Query 9:

### Query 10:

### Query 11:

### Query 12:

### Query 13:

### Query 14:

### Query 15:



