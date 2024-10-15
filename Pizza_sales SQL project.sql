CREATE DATABASE pizza_sales
select * from [dbo].[pizza_sales]


--Total revenue
select SUM(total_price) as total_revenue from pizza_sales

--Average order value
select sum(total_price) / count(distinct order_id) as Avg_order_value from pizza_sales;

--Total Pizza sold
select sum(quantity) as Total_sold from pizza_sales;

--Total order
select count(distinct order_id) as Total_order from pizza_sales;

--Average Pizza per order
select sum(quantity) / count(distinct order_id) from pizza_sales;

--Daily trend for total orders
select DATENAME(DW, order_date) as order_day, count(distinct order_id) as total_orders
from pizza_sales
group by DATENAME(DW, order_date);

--Hourly trend for total_orders
select DATEPART(HOUR, order_time) as order_hours, count(distinct order_id) as total_orders
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time);

--Percentage of sales by Pizza category
select pizza_category, sum(total_price) * 100 / (select sum(total_price) from pizza_sales)
from pizza_sales
group by pizza_category;

--Percentage of sales by pizza size
select pizza_size, sum(total_price) * 100 / (select sum(total_price) from pizza_sales)
from pizza_sales
group by pizza_size
order by pizza_size desc;

--Total pizzas sold by pizza category
select pizza_category, sum(quantity) as total_sold
from pizza_sales
group by pizza_category;


--Top 5 best sellers by total pizza sold
select TOP 5 pizza_name, sum(quantity) as total_pizza_sold
from pizza_sales
group by pizza_name
order by sum(quantity) ASC;