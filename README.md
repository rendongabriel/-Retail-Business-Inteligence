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

### Query 2
* Question that we should answer: What are the total sales and the average ticket per city, ordered from the highest-grossing city to the lowest?
* Understanding total sales and average ticket by city helps identify the most profitable markets and prioritize resource allocation. It provides a clear view of revenue concentration and purchasing power across locations. This insight supports better planning in logistics, staffing, and regional strategies. It also allows businesses to compare performance across cities. Ultimately, it helps focus efforts where returns are highest.

### Query 3:
* Question that we should answer: What percentage of total sales comes from returning customers versus new customers?
* Analyzing the percentage of sales from returning vs new customers provides insight into customer loyalty and acquisition effectiveness. It helps evaluate whether the business relies more on retention or constant acquisition. This distinction is key for marketing strategy and budget allocation. High retention usually indicates strong customer satisfaction. It also helps forecast future revenue stability.

### Query 4:
* Question that we should answer: Which cities generate the most revenue but have lower customer satisfaction, representing a potential business risk?
* Identifying high-revenue cities with low customer satisfaction highlights potential risks that could impact long-term profitability. These markets may perform well now but are vulnerable to decline. Poor satisfaction can lead to churn and negative word-of-mouth. This insight helps prioritize service improvements. It ensures sustainable growth rather than short-term gains.

### Query 5:
* Question that we should answer: Which product categories have high sales volume but a low average ticket?
* Detecting categories with high volume but low average ticket helps refine pricing and bundling strategies. It shows where many transactions occur but with low revenue per sale. This may indicate opportunities for upselling or cross-selling. Businesses can redesign offers to increase value per transaction. It also helps optimize promotional strategies.

### Query 6:
* Question that we should answer: Which product categories show the highest month-over-month sales growth, and what is their percentage variation?
* Evaluating month-over-month growth by category allows tracking trends and spotting fast-growing product segments. It helps identify which categories are gaining momentum over time. This is useful for forecasting demand and planning inventory. It also supports innovation and product development decisions. Growth trends are key for staying competitive.

### Query 7:
* Question that we should answer: Which cities account for 80% of total sales (Pareto rule)?
* Applying the Pareto rule (80/20) helps focus efforts on the cities that generate the majority of revenue. It simplifies decision-making by highlighting key contributors. Businesses can allocate resources more efficiently. It also helps identify overdependence on certain markets. This insight is crucial for risk management and scaling.

### Query 8:
* Question that we should answer: Which categories have high total sales but a low returning customer rate?
* Finding categories with high sales but low retention reveals opportunities to improve customer experience and loyalty. It suggests that customers buy but do not return. This may indicate issues in quality, service, or expectations. Addressing this can increase lifetime customer value. It strengthens long-term business performance.

### Query 9:
* Question that we should answer: Which cities have above-average delivery times and still maintain a higher-than-average returning customer rate?
* Comparing delivery times with retention rates helps assess operational efficiency and its impact on customer behavior. Long delivery times can reduce satisfaction and repeat purchases. This query links logistics performance with customer outcomes. It helps identify inefficiencies in the supply chain. Improving this can directly boost loyalty.

### Query 10:
* Question that we should answer: Which categories have an average ticket higher than the overall business average?
* Identifying categories with above-average ticket values supports premium product strategies and revenue maximization. These categories generate more value per transaction. They can be prioritized in marketing and positioning. This insight helps build a premium brand image. It also increases profitability without increasing volume.

### Query 11:
* Question that we should answer: Which cities have more unique customers than the average number of customers per city?
* Detecting cities with above-average unique customers helps target expansion and marketing efforts. It shows where customer acquisition is strongest. These markets may offer growth opportunities. Businesses can replicate successful strategies in similar regions. It also supports geographic expansion planning.

### Query 12:
* Question that we should answer: Which categories exceed the business’s annual average sales in each year?
* Comparing category performance against annual averages highlights strong performers over time. It helps identify consistent and reliable categories. This supports long-term planning and investment decisions. It also reduces uncertainty in demand forecasting. Strong categories can become strategic pillars.

### Query 13:
* Question that we should answer: Which cities have a share of total sales that exceeds the average share across all cities?
* Identifying cities with above-average sales share helps prioritize key geographic markets. These cities contribute significantly to total revenue. They deserve focused attention and resources. It also helps balance expansion with consolidation. This ensures efficient market coverage.

### Query 14:
* Question that we should answer: Which categories have a returning customer rate above the business average but an average ticket below the global average?
* Detecting categories with high retention but low ticket suggests opportunities to increase customer spending. Loyal customers are already engaged with the brand. The goal is to increase their purchase value. Strategies like upselling and bundling are effective here. This improves overall revenue without new customer acquisition.

### Query 15:
* Question that we should answer: Which cities have experienced positive sales growth for at least two consecutive months?
* Identifying cities with consistent positive growth helps recognize stable and expanding markets. These cities show reliable performance over time. They are ideal for further investment and scaling. Growth consistency reduces business risk. It also signals strong local demand.

## Conclusion

Together, these queries provide a comprehensive and multi-dimensional analysis of a retail business, combining insights from sales performance, customer behavior, product dynamics, and operational efficiency. By exploring data across cities, categories, and time periods, they allow the identification of key revenue drivers, high-growth segments, and underperforming areas.
They also help uncover critical patterns such as customer retention, purchasing habits, and the balance between new and returning clients, which are essential for building long-term relationships and ensuring stable revenue streams. Additionally, the queries highlight operational challenges, such as delivery inefficiencies or low customer satisfaction, enabling proactive improvements.
Moreover, the use of comparative metrics (averages, growth rates, and percentages) supports benchmarking and prioritization, ensuring that decisions are based on performance gaps and opportunities. This makes it easier to allocate resources effectively and focus on high-impact strategies.
Overall, this set of queries empowers data-driven decision-making in key retail areas such as pricing, marketing, inventory management, customer experience, and geographic expansion, ultimately driving profitability, competitiveness, and sustainable business growth.


