# Retail Business Inteligence 🕴️
### An end-to-end data solution transforming raw retail transaction logs into actionable business intelligence.
## 🏗️ Part 1: SQL & Data Modeling (The Foundation)
## Table selection and strategy
I organized the data into Fact and Dimension tables to ensure data integrity and query efficiency:
#1. Fact Tables (Quantitative): Fact_Sales, Fact_Inventory. These store the "events" (e.g., every time a barcode is scanned).
#2. Dimension Tables (Descriptive): Dim_Products, Dim_Stores, Dim_Customers, Dim_Date. These provide the context (e.g., where was it sold, and who bought it?).
