CREATE TABLE bi.dim_customer AS
SELECT
	customer_id,
	MAX(age) as age,
	MAX(gender) as genre,
	MAX(city) as city,
	BOOL_OR(is_returning_customer) as is_returning_customer
FROM staging.e_commerce
GROUP BY customer_id;
---Esta tabla fue creada para clientes en específico