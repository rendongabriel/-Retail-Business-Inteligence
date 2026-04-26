# 🛍️ Retail Business Intelligence Project

https://github.com/rendongabriel/-Retail-Business-Inteligence/blob/main/Retail%20Business%20Inteligence%202.png?raw=true

<p align="center">
  <img src="https://github.com/rendongabriel/-Retail-Business-Inteligence/blob/main/Retail%20Business%20Inteligence%202.png?raw=true" width="900" alt="Executive Dashboard Preview">
</p>

## 🚀 Full-Stack Engineering & Strategic Data Ecosystem

This project demonstrates a complete data lifecycle: from low-level optimization and scalable backend architecture to advanced business intelligence. It bridges the gap between raw code and executive decision-making.

---

## 🛠️ Tech Stack & Core Utility
* ![SQL](https://img.shields.io/badge/SQL-00758F?style=for-the-badge&logo=sql&logoColor=white) :Advanced querying for Complex ETL (Extract, Transform, Load) processes.
* ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white) :Primary relational database for fast, transactional web data storage.
* ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white) :Used for complex analytical workloads and advanced data integrity.
* ![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white) :Version control, CI/CD pipelines, and collaborative management of data scripts and models.
* ![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black) :Data modeling and interactive storytelling through high-impact dashboards.

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

# 🖥️ Data Visualization through Power BI

## 📊 Strategic Analytics Framework (DAX)

I curated a selection of **15 critical measures** designed to move beyond simple reporting into **Predictive and Diagnostic Analytics**.

### 🟢 Business Performance (Efficiency Metrics)
* **Total Sales / Orders / Quantity:** Monitoring the core volume of the operation.
* **Average Ticket:** Analyzing customer purchasing power per transaction.
* **Orders per Customer:** Measuring purchase frequency and engagement.

### 🔵 Customer Value & Contribution (ROI)
* **Revenue per Customer & CLV:** Determining the long-term profitability of the user base.
* **Participation %:** Understanding market share within internal categories.
* **Top 20% Revenue Share (Pareto):** Identifying the vital segment that drives 80% of revenue.

### 🟣 Retention & Behavior (Loyalty)
* **Returning Customer Rate:** Quantifying the success of retention strategies.
* **Active Month Ratio:** Tracking user consistency over fiscal periods.

### 🟡 Risk & Stability (Financial Health)
* **Revenue Stability:** Assessing income volatility to ensure predictable cash flow.
* **Category Dependence:** Identifying if the business relies too heavily on a single product line.

### 🔴 Growth (Scalability)
* **Growth Percentage:** Measuring MoM (Month over Month) and YoY (Year over Year) expansion.

---

## 💡 Key Business Insights

> [!TIP]
> **Concentration Risk Analysis:** The Pareto analysis reveals that **20% of customers generate ~X% of total revenue**. This indicates a high reliance on a specific segment. Recommendation: Implement a VIP loyalty program to secure this revenue while diversifying acquisition channels.

---

## ⚙️ How It Works

1.  **Data Layer:** Transactional data is stored in **MySQL** and **PostgreSQL**.
2.  **Logic Layer:** **Laravel** and **Node.js** manage the data flow and business rules.
3.  **DevOps & Versioning:** All code, SQL scripts, and DAX documentation are managed via **GitHub** for auditability and CI/CD.
4.  **Intelligence Layer:** Data is consumed by **Power BI**, using a **Star Schema** model to ensure lightning-fast DAX calculations.

---

## 📬 Contact
* **Name:** Gabriel Alejandro Rendón Hurtado
* **Role:** Data Analyst
* **LinkedIn:** https://www.linkedin.com/in/gabriel-alejandro-rend%C3%B3n-hurtado-56157a302?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app


## 📌 Final Thoughts

This project reflects a real-world Business Intelligence workflow, where technical skills are combined with business understanding to generate meaningful insights. It showcases the ability to transform raw transactional data into strategic value for decision-making in a retail environment.

