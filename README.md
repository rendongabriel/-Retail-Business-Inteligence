# 🛍️ Retail Business Intelligence Project

### End-to-End Data Analysis for Strategic Decision-Making

This project presents a complete Business Intelligence solution designed to transform raw retail transaction data into actionable insights. It combines data modeling, SQL analytics, and business-oriented thinking to support data-driven decision-making in a retail environment.

---

## 🏗️ Data Model & Architecture

To ensure scalability, consistency, and analytical performance, the data was structured using a **star schema model**, separating transactional data from descriptive attributes.

### 🔹 Fact Table: `fact_sales`

| Column | Description |
|------|------------|
| order_id | Unique identifier for each order |
| date_id | Foreign key linked to the date dimension |
| customer_id | Identifier of the customer |
| product_id | Identifier of the product |
| quantity | Number of items purchased |
| unit_price | Price per unit |
| discount_amount | Discount applied per product |
| total_amount | Final transaction value after discounts |
| delivery_time_days | Delivery duration in days |
| customer_rating | Customer satisfaction score (1–5) |
| session_duration_minutes | Time spent on platform |
| pages_viewed_website | Number of pages viewed |

---

### 🔹 Dimension Tables

#### `dim_date`

| Column | Description |
|------|------------|
| date_id | Unique date key |
| year | Year |
| month | Month number |
| month_name | Month name |
| quarter | Quarter |
| day | Day |
| is_weekend | Weekend indicator |
| week_of_year | Week number |

#### `dim_products`

| Column | Description |
|------|------------|
| product_id | Unique product identifier |
| product_category | Product category |

#### `dim_customers`

| Column | Description |
|------|------------|
| customer_id | Unique customer identifier |
| age | Customer age |
| gender | Customer gender |
| city | Customer location |
| is_returning_customer | Returning customer flag |
| first_order_date | First purchase date |
| last_order_date | Last purchase date |
| total_orders | Total orders |
| total_spent_dollars | Customer lifetime value |

---

## 📊 Business Questions & SQL Analysis

### 💰 Revenue & Sales Distribution
- What are the total sales and how are they distributed by month and year?  
- What are the total sales and average ticket per city?  
- Which cities account for 80% of total sales (Pareto rule)?  
- Which cities have a share of total sales above the average?  

**Impact:** Helps identify revenue concentration, seasonal trends, and key geographic markets to prioritize.

---

### 👥 Customer Behavior & Retention
- What percentage of sales comes from returning vs new customers?  
- Which categories have high sales but low returning customer rates?  
- Which categories have high retention but low average ticket?  
- Which cities maintain high retention despite operational inefficiencies?  

**Impact:** Provides insights into customer loyalty, segmentation, and opportunities to increase lifetime value.

---

### 📦 Product & Category Performance
- Which product categories have high sales volume but low average ticket?  
- Which categories exceed the annual average sales?  
- Which categories have above-average ticket values?  

**Impact:** Supports pricing, product positioning, and portfolio optimization strategies.

---

### 📈 Growth & Trends Analysis
- Which product categories show the highest month-over-month growth?  
- Which cities have experienced positive growth for at least two consecutive months?  

**Impact:** Identifies growth opportunities and emerging trends to guide strategic investments.

---

### 🚚 Operations & Customer Experience
- Which cities generate high revenue but have low customer satisfaction?  
- Which cities have above-average delivery times but still retain customers?  

**Impact:** Links operational performance with customer satisfaction, helping detect risks and inefficiencies.

---

### 🌍 Market & Customer Distribution
- Which cities have more unique customers than the average?  

**Impact:** Helps identify high-potential markets for expansion and targeted marketing.

---

## 🧠 Key Insights

This project demonstrates how SQL and data modeling can be used to:

- Analyze sales performance across time, geography, and products  
- Understand customer behavior, retention, and segmentation  
- Detect operational inefficiencies affecting satisfaction  
- Identify growth trends and high-potential markets  
- Apply business frameworks such as Pareto analysis and benchmarking  

---

## 🚀 Business Value

By combining structured data modeling with advanced SQL queries, this project enables:

- Data-driven decision-making  
- Revenue optimization through pricing and segmentation  
- Improved inventory and demand planning  
- Enhanced customer experience and retention  
- Strategic expansion based on performance insights  

---

## 🛠️ Tools & Technologies

- **Database:** PostgreSQL  
- **Language:** SQL  
- **Modeling Approach:** Star Schema  
- **Techniques:** CTEs, Window Functions, Aggregations, Business KPIs  

---

## 📌 Final Thoughts

This project reflects a real-world Business Intelligence workflow, where technical skills are combined with business understanding to generate meaningful insights. It showcases the ability to transform raw transactional data into strategic value for decision-making in a retail environment.

