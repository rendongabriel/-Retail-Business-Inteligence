CREATE TABLE bi.dim_products (
	product_id SERIAL PRIMARY KEY,
	product_category VARCHAR
);

INSERT INTO bi.dim_products (
	product_category
)
SELECT DISTINCT product_category
FROM staging.e_commerce;

--Implemented surrogate keys for product dimension to ensure scalability and performance in a star schema.
--Joins combined with int allow us finish the task quickly.


