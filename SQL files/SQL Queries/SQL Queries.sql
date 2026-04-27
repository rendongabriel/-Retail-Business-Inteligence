-- Total sales amount
SELECT SUM(total_amount) FROM bi.fact_sales;

-- 1. How much did we sell in total and how are sales distributed by month and year?

SELECT * FROM bi.dim_date;

SELECT * FROM bi.dim_date;

SELECT 
	d.month_name, 
	SUM(f.total_amount) AS total_sales
FROM bi.fact_sales as f
LEFT JOIN bi.dim_date AS d
	ON f.date_id=d.date_id
GROUP BY d.month_name
ORDER BY total_sales DESC;

-- 2. I want to see total sales and average ticket by city, ordered from highest to lowest revenue
SELECT 
	c.city as city, 
	SUM(f.total_amount) as total_sales, 
	AVG(f.total_amount) as avg_ticket
FROM bi.fact_sales as f
LEFT JOIN bi.dim_customers as c
	ON f.customer_id=c.customer_id
GROUP BY city
ORDER BY total_sales DESC;

-- What percentage of total sales comes from returning vs new customers?
SELECT 
	is_returning_customer as returning_or_not, 
	SUM(f.total_amount)/SUM(SUM(f.total_amount)) OVER ()*100 as new_percentage
FROM bi.fact_sales as f
LEFT JOIN bi.dim_customers as c
ON f.customer_id=c.customer_id
GROUP BY returning_or_not;

-- Which cities generate the most revenue but have the worst customer satisfaction (business risk)?

SELECT 
	c.city AS city, 
	AVG(f.customer_rating) as avg_rating, 
	SUM(f.total_amount) as total
FROM bi.fact_sales AS f
LEFT JOIN bi.dim_customers AS c
	ON f.customer_id=c.customer_id
GROUP BY city
ORDER BY total DESC, avg_rating ASC;

-- Which product categories have high sales volume but low average ticket?

SELECT 
	p.product_category AS category, 
	COUNT(*) AS Sales_volume, 
	AVG(f.total_amount) as Average_ticket
FROM bi.fact_sales as f
LEFT JOIN bi.dim_products as p
	ON f.product_id=p.product_id
GROUP BY p.product_category
ORDER BY Average_ticket ASC, Sales_volume DESC;

-- Which product categories have the highest month-over-month sales growth and what is the percentage change?

WITH sales_according_to_months AS (
	SELECT
		p.product_category,
		SUM(f.total_amount) AS sales,
		d.month,
		d.month_name,
		d.year
	FROM bi.fact_sales AS f
	LEFT JOIN bi.dim_products AS p
		ON f.product_id=p.product_id
	LEFT JOIN bi.dim_date AS d
		ON f.date_id=d.date_id
	GROUP BY
		p.product_category,
		d.year,
		d.month,
		d.month_name
),

growth_calc AS (
SELECT
	product_category,
	sales,
	year,
	month_name,
	LAG (sales) OVER (
		PARTITION BY product_category
		ORDER BY year, month
	) AS previous_month,
	sales-LAG (sales) OVER (
		PARTITION BY product_category
		ORDER BY year, month
	) AS growth

	FROM sales_according_to_months
)

SELECT *
FROM growth_calc
WHERE previous_month IS NOT NULL
ORDER BY growth DESC
LIMIT 20
;

-- Which cities account for 80% of total sales (Pareto rule)?

SELECT
	c.city as City,
	SUM(f.total_amount) as Sales,
	ROUND (
		SUM(f.total_amount)*100/ SUM(SUM(f.total_amount)) OVER (), 2)
	AS pct_total
FROM bi.fact_sales AS f
LEFT JOIN bi.dim_customers AS c
	ON f.customer_id=c.customer_id
GROUP BY City
ORDER BY Sales DESC;

-- Which categories have high total sales but low returning customer rate?

SELECT
	p.product_category AS Category,
	ROUND(
		SUM(f.total_amount)*100/ SUM(SUM(f.total_amount)) OVER (), 2)
	AS High_sales_percentage,
	ROUND(
		COUNT(DISTINCT CASE
			WHEN c.is_returning_customer=true THEN f.customer_id
			END)::numeric
			/COUNT(DISTINCT f.customer_id), 2
			)
	AS returning_percentage
FROM bi.fact_sales AS f
LEFT JOIN bi.dim_products AS p
	ON f.product_id=p.product_id
LEFT JOIN bi.dim_customers AS c
	ON f.customer_id=c.customer_id
GROUP BY Category
ORDER BY High_sales_percentage DESC;

-- Which cities have above-average delivery times but still maintain above-average returning customer rates?

SELECT
	 c.city AS city,
	 ROUND(AVG(f.delivery_time_days),2) AS average_per_time,
	 ROUND(COUNT(DISTINCT CASE
	 			WHEN c.is_returning_customer=true THEN f.customer_id
				 END)::numeric
				 /
				 COUNT(DISTINCT f.customer_id), 2)
	AS percentage_returning
FROM bi.fact_sales AS f
LEFT JOIN bi.dim_customers AS c
	ON f.customer_id=c.customer_id
GROUP BY city
HAVING 
	AVG(f.delivery_time_days) >
	(
		SELECT AVG(delivery_time_days)
		FROM bi.fact_sales
	) AND

	(ROUND(COUNT(DISTINCT CASE
	 			WHEN c.is_returning_customer=true THEN f.customer_id
				 END)::numeric
				 /
				 COUNT(DISTINCT f.customer_id), 2)) >

		(
		SELECT
			COUNT(DISTINCT CASE
				WHEN c.is_returning_customer = true THEN f.customer_id
			END)::numeric
			/
			COUNT(DISTINCT f.customer_id)
		FROM bi.fact_sales f
		JOIN bi.dim_customers c
			ON f.customer_id = c.customer_id
	)

ORDER BY average_per_time DESC;

-- Which categories have an average ticket higher than the global average?

SELECT
	p.product_category AS product_category,
	SUM(f.total_amount)/COUNT(f.order_id) AS average_ticket
FROM bi.fact_sales as f
LEFT JOIN bi.dim_products AS p
	ON f.product_id=p.product_id
GROUP BY product_category
HAVING 
	SUM(f.total_amount)/COUNT(f.order_id) > 
	(
		SELECT
			AVG(avg_ticket)
		FROM (
			SELECT
				SUM(total_amount) / COUNT(order_id) AS avg_ticket
			FROM bi.fact_sales f2
			GROUP BY f2.product_id

		)
	
)
ORDER BY average_ticket DESC;

-- Which cities have more unique customers than the average per city?

SELECT
	c.city AS city,
	COUNT(DISTINCT c.customer_id) AS customers_quantity
FROM bi.dim_customers AS c
GROUP BY city
HAVING COUNT(DISTINCT c.customer_id) > (
	SELECT
		AVG(clientes)
	FROM (
		SELECT
			c.city AS city,
			COUNT(DISTINCT c.customer_id) AS clientes
			FROM bi.dim_customers AS c
			GROUP BY city
	) AS sub
)
ORDER BY customers_quantity DESC;

-- Identify categories that exceed the yearly average sales of the business

SELECT
	p.product_category AS category,
	SUM(f.total_amount) AS average_sales,
	d.year AS year_time
FROM bi.fact_sales AS f
LEFT JOIN bi.dim_date AS d
	ON f.date_id=d.date_id
LEFT JOIN bi.dim_products AS p
	ON f.product_id=p.product_id
GROUP BY year_time, category
HAVING SUM(f.total_amount) > (
	SELECT
		AVG(subquery)
	FROM (
		SELECT
			SUM(f2.total_amount) AS subquery
		FROM bi.fact_sales AS f2
		JOIN bi.dim_date AS d2
			ON f2.date_id=d2.date_id
		WHERE d2.year=d.year
		GROUP BY f2.product_id) AS sub2
	) 
ORDER BY average_sales DESC;

-- Detect cities whose share of total sales exceeds the average share

WITH principal_query AS (

SELECT
	c.city AS city,
	SUM(f.total_amount) AS total,
	ROUND(
		SUM(f.total_amount)/SUM(SUM(f.total_amount)) OVER (), 2
	) AS percentage_per_city
	
FROM bi.fact_sales AS f
LEFT JOIN bi.dim_customers AS c
	ON f.customer_id=c.customer_id
GROUP BY city
	),

percentage_total AS (
	SELECT
		AVG(percentage_per_city) AS total_average
	FROM principal_query
)

SELECT * FROM principal_query
WHERE percentage_per_city > (SELECT total_average FROM percentage_total)
ORDER BY percentage_per_city DESC;

-- Detect categories where returning rate is above average but average ticket is below global average

WITH first_query AS (

SELECT
	p.product_category AS category,
	SUM(f.total_amount)/COUNT(f.order_id) AS average_ticket_per_category,
	COUNT(DISTINCT CASE WHEN c.is_returning_customer = true 
			THEN f.customer_id 
			END)
	/
	COUNT(DISTINCT f.customer_id)::numeric
	AS customer_retention_rate
FROM bi.fact_sales AS f
LEFT JOIN bi.dim_products AS p
	ON f.product_id=p.product_id
LEFT JOIN bi.dim_customers AS c
	ON f.customer_id=c.customer_id
GROUP BY category
	),

average_query AS (

SELECT
	AVG(customer_retention_rate) AS average_retention_rate,
	AVG(average_ticket_per_category) AS average_ticket
FROM first_query
)

SELECT * FROM first_query
WHERE average_ticket_per_category> (SELECT average_ticket FROM average_query) 
	AND customer_retention_rate > (SELECT average_retention_rate FROM average_query)
ORDER BY average_ticket_per_category DESC, customer_retention_rate DESC;

-- Identify cities with positive sales growth for at least two consecutive months

WITH first_query AS (
	SELECT
		c.city AS city,
		SUM(f.total_amount) AS sales,
		d.year AS year,
		d.month AS month
	FROM bi.fact_sales AS f
	LEFT JOIN bi.dim_date AS d
		ON f.date_id = d.date_id
	LEFT JOIN bi.dim_customers AS c
		ON f.customer_id = c.customer_id
	GROUP BY c.city, d.year, d.month
),

second_query AS (
	SELECT
		city,
		year,
		month,
		sales,
		LAG(sales) OVER (
			PARTITION BY city
			ORDER BY year, month
		) AS lag_sales,
		
		(sales - LAG(sales) OVER (
			PARTITION BY city
			ORDER BY year, month
		)) 
		/ 
		LAG(sales) OVER (
			PARTITION BY city
			ORDER BY year, month
		) AS growth_percentage
	FROM first_query
),

third_query AS (
	SELECT
		city,
		year,
		month,
		sales,
		lag_sales,
		growth_percentage,
		CASE 
			WHEN growth_percentage > 0 THEN 1
			ELSE 0
		END AS positive_growth
	FROM second_query
),

fourth_query AS (
	SELECT
		city,
		year,
		month,
		sales,
		lag_sales,
		growth_percentage,
		positive_growth,
		LAG(positive_growth) OVER (
			PARTITION BY city
			ORDER BY year, month
		) AS lag_positive_growth
	FROM third_query
)

SELECT 
	DISTINCT city,
	sales,
	ROUND(lag_sales) as lag_sales_2,
	ROUND(growth_percentage,2) as growth_percentage_2,
	ROUND(lag_positive_growth) as lag_positive_growth_2,
	positive_growth
FROM fourth_query
WHERE lag_positive_growth = 1
  AND positive_growth = 1;

	
	