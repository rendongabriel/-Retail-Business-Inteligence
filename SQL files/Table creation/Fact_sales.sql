DROP TABLE bi.fact_sales;

CREATE TABLE bi.fact_sales(
	order_id VARCHAR PRIMARY KEY,
	date_id DATE,
	customer_id VARCHAR,
	product_id INT,
	quantity INT,
	unit_price NUMERIC(10,2),
	discount_amount NUMERIC(10,2),
	total_amount NUMERIC(10,2),
	delivery_time_days INT,
	customer_rating INT,
	session_duration_minutes INT,
	pages_viewed_website INT,

	CONSTRAINT fk_date
		FOREIGN KEY (date_id) REFERENCES bi.dim_date(date_id),

	CONSTRAINT fkcustomer
		FOREIGN KEY (customer_id) REFERENCES bi.dim_customers(customer_id),

	CONSTRAINT fk_product
		FOREIGN KEY (product_id) REFERENCES bi.dim_products(product_id) 
);

INSERT INTO bi.fact_sales (
	order_id,
	date_id,
	customer_id,
	product_id,
	quantity,
	unit_price,
	discount_amount,
	total_amount,
	delivery_time_days,
	customer_rating,
	session_duration_minutes,
	pages_viewed_website
)

--Asignamos e para la mayor rapidez posible
SELECT
	e.order_id,
	e.date,
	e.customer_id,
	p.product_id,
	e.quantity,
	e.unit_price,
	e.discount_amount,
	e.total_amount,
	e.delivery_time_days,
	e.customer_rating,
	e.session_duration_minute,
	e.pages_viewed
FROM staging.e_commerce AS e

JOIN bi.dim_products AS p
ON e.product_category = p.product_category;