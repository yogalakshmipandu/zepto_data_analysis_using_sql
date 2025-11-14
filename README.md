# zepto_data_analysis_using_sql - A SQL Project
Analysing the zepto dataset and drawing insights which are helpful for the businesses to take decisions faster.

This project is an end-to-end SQL-based data exploration and business insights analysis performed on a dataset inspired by Zepto (Quick Commerce).
It includes data cleaning, preprocessing, exploratory analysis, and advanced insights, all using pure SQL.

🚀 Project Objectives

1.Clean and validate the Zepto dataset

2.Explore product categories, pricing, discounts, and inventory

3.Identify anomalies and inconsistencies

4.Generate valuable business insights

5.Calculate revenue metrics and pricing indicators


🛠️ Technologies Used

MySQL Server

SQL concepts such as:

1.Data Cleaning

2.Aggregations & Grouping

3.CASE Statements

4.DISTINCT & ORDER BY

5.Business Logic Queries


🔍 Key Steps Performed
✅ 1. Data Exploration

Displayed complete dataset

Counted total records

Checked for NULL values

Identified unique categories

Compared in-stock vs out-of-stock products

Found duplicate product names

✅ 2. Data Cleaning

Removed items with mrp = 0 or discountedSellingPrice = 0

Converted price values from paise to rupees

Ensured valid numeric values

✅ 3. Business Insights Generated
📌 Top 10 Best Value Products

Ordered by highest discount.

📌 High-MRP Products That Are Out of Stock

Useful for identifying high-demand items.

📌 Estimated Revenue by Category

Using:

discountedSellingPrice × availableQuantity

📌 Products With High MRP (>500) and Low Discount (<10%)
📌 Top 5 Categories by Average Discount
📌 Price Per Gram Analysis

To find best-value weight-based products.

📌 Product Weight Classification

Low if (< 1000g)

Medium if (< 5000g)

Bulk if (≥ 5000g)

📌 Total Inventory Weight per Category
📌 Most Popular Categories by Product Count
📌 Top 10 Highest Absolute Discounts
📌 Stock Value by Category (at MRP)
📌 Anomaly Detection
📌 Revenue Contribution % by Category
