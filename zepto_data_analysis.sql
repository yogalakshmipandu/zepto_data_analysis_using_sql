
-- Creating the database
create database zeptodb

--using the zepto database
use zeptodb

-- Dropping the table if it exists

drop table if exists zepto

-- Creating the table

create table zepto(
id int primary key not null,
category varchar(50),
name varchar(50),
mrp int,
discountPercent int,
availableQuantity int,
discountedsellingprice int,
weightgms int,
outofstock varchar(10),
quantity int
)

--DATA EXPLORATION 

select * from zepto_v1 

-- Defining the size of the table

select count(*) from zepto_v1


-- To check if any null values

select * from zepto_v1 
where
category is null or
name is null or
mrp is null or
discountPercent is null or
availableQuantity is null or
discountedSellingPrice is null or
weightInGms is null or 
outOfStock is null or
quantity is null

-- NO null values

-- Different product Categories 

select distinct category
from zepto_v1
order by category

--Products in stock VS Out of stock
select outOfStock , count(*) as [count]
from zepto_v1
group by 
outOfStock

-- There are 453 products which are in  out of stock 

-- Product names present multiple times

select name, count(*) as [Number of items]
from zepto_v1 
group by name
having count(*)>1
order by count(*) desc


--- DATA CLEANING

-- Finding the products whose mrp is zero

select *
from zepto_v1
where mrp = 0 or
discountedSellingPrice = 0

-- As the products should have price so we need to delete the products with mrp =0

delete from  zepto_v1
where  mrp = 0 or 
discountedSellingPrice =0

-- The data set consists of the mrp in paise . converting it into rupees

update zepto_v1
set mrp = mrp/100,
discountedSellingPrice =discountedSellingPrice/100

select mrp,discountedSellingPrice  from zepto_v1

--BUSINESS INSIGHTS

--1. Top 10 best valued products based on discount percentage

select top 10 name,mrp,discountedSellingPrice  
from zepto_v1 
order by discountedSellingPrice  desc

-- 2. Products with high MRP (i.e grater than 300) but Out of stock

select distinct name,mrp
from zepto_v1
where outOfStock = 1 and mrp >300
order by name

--3. Calculate the estimated revenue for each category

select category,
sum(discountedSellingPrice * availableQuantity) as [Total_Revenue]
from zepto_v1
group by category
order by Total_Revenue

-- 4. Find all products with MRP greater than  500 and discount less than 10%

select distinct name , mrp,discountPercent
from zepto_v1
where mrp > 500 and
discountPercent < 10
order by mrp desc, discountPercent desc

-- 5. Identify the top 5 categories offering the highest average discount percentage

select top 5 category , avg(discountPercent) as [Avg_discount]
from zepto_v1
group by category
order by avg_discount desc 

--6.Find the price per gram for products above 100g and  sort by best values

select distinct name,weightInGms, discountedSellingPrice,round(discountedSellingPrice / weightInGms,2) as price_per_Gms 
from zepto_v1
where weightInGms >100
order by price_per_Gms desc

--7. Group the products into categories like low, medium and high 

select distinct name, weightInGms ,
CASE when weightInGms < 1000 then 'Low'
	 when weightInGms < 5000 then 'Medium'
	 else 'Bulk'
	 end as weight_category
from zepto_v1

-- 8. Total Inventory Weight per Category

select category,
sum(weightInGms * availableQuantity) as total_weight
from zepto_v1
group  by category
order by total_weight


--- 9.Most Popular Categories by Number of Products
select category, count(*) as product_count
from zepto_v1
group by category
order by product_count desc

-- 10. Products with the Highest Discount in Absolute Terms (MRP – Discounted Price)

select top 10 * from zepto_v1

select top 10 name,mrp,discountedSellingPrice,(mrp - discountedSellingPrice) as absolute_discount
from zepto_v1
order by absolute_discount desc

--11. Stock Value by Category (Potential Revenue if all inventory is sold at MRP)

select category,sum(mrp*quantity) as Stock_price
from zepto_v1
group by Category
order by Stock_price desc

--12.Identify Anomalies (Products where discount is > 80% or MRP < Discounted Price)

select * from 
zepto_v1
where discountPercent > 80 or
mrp < discountedSellingPrice


--13. Contribution of Each Category to Total Revenue (% Share)

select category,
round(sum(discountedSellingPrice * availableQuantity) * 100.0 /
      (select sum(discountedSellingPrice * availableQuantity) from zepto_v1), 2) 
      as revenue_share_percent
from zepto_v1
group by category
order by revenue_share_percent desc;