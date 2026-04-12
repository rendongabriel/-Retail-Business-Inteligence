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

## Queries SQL by PostgreSQL 💻

_Consider that our code was made by PostgreSQL. If you want to see the code, look at the file named as Queries Obtained_

### Query 1 💰:
* Question that we should answer: How much did we sell in total, and how are sales distributed by month and year?
* This query is important because it helps analyze overall sales performance and identify how revenue is distributed across different months and years. By aggregating total sales and grouping them by month, it allows businesses to detect seasonal trends, peak sales periods, and potential low-performance months. This insight supports better decision-making in areas such as marketing strategies, inventory planning, and resource allocation.

### Query 2:
* Question that we should answer: What percentage of total sales comes from returning customers versus new customers?
* 

### Query 3:
* Question that we should answer: Which cities generate the most revenue but have lower customer satisfaction, representing a potential business risk?
* 

### Query 4:
* Question that we should answer: Which product categories have high sales volume but a low average ticket?
* 

### Query 5:
* Question that we should answer: Which product categories show the highest month-over-month sales growth, and what is their percentage variation?
* 

### Query 6:
* Question that we should answer: Which cities account for 80% of total sales (Pareto rule)?
* 

### Query 7:
* Question that we should answer: Which categories have high total sales but a low returning customer rate?
* 

### Query 8:
* Question that we should answer: Which cities have above-average delivery times and still maintain a higher-than-average returning customer rate?
* 

### Query 9:
* Question that we should answer: Which categories have an average ticket higher than the overall business average?
* 

### Query 10:
* Question that we should answer: Which cities have more unique customers than the average number of customers per city?
* 

### Query 11:
* Question that we should answer: Which categories exceed the business’s annual average sales in each year?
* 

### Query 12:
* Question that we should answer: Which cities have a share of total sales that exceeds the average share across all cities?
* 

### Query 13:
* Question that we should answer: Which categories have a returning customer rate above the business average but an average ticket below the global average?
* 

### Query 14:
* Question that we should answer: Which cities have experienced positive sales growth for at least two consecutive months?
* 


