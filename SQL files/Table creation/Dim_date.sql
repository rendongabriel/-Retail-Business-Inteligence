CREATE TABLE bi.dim_date (
	date_id date PRIMARY KEY,
	year INT,
	month INT,
	month_name VARCHAR,
	quarter INT,
	day INT,
	is_weekend BOOLEAN, 
	week_of_year INT
);
