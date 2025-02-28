use PizzaDB
select * from pizza_sales;
Select SUM(total_price) as Total_Revenue from pizza_sales;
Select Count(Distinct order_id) as Total_Orders from pizza_sales;
Select SUM(total_price)/Count(Distinct order_id) as Average_Order_Value from pizza_sales;
Select SUM(quantity) as Total_pizza_quantity from pizza_sales;

Select SUM(Quantity)/Count(Distinct order_id) as Average_Pizza_Sold from pizza_sales;

Select Cast(SUM(Quantity) as decimal(10,2))/
Cast(Count(Distinct order_id) as decimal(10,2)) as Average_Pizza_Sold from pizza_sales;

Select Cast(Cast(SUM(Quantity) as decimal(10,2))/
Cast(Count(Distinct order_id) as decimal(10,2)) as decimal(10,2)) from pizza_sales;

Select Cast(SUM(Quantity)/Count(Distinct order_id) as decimal(10,2))
from pizza_sales;



Select DATENAME(DW,order_date) as order_day,
COUNT(DISTINCT order_id) as Total_orders
from pizza_sales
GROUP BY DATENAME(DW,order_date);

Select DATENAME(MONTH,order_date) as order_month,
COUNT(DISTINCT order_id) as Total_orders
from pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY Total_orders DESC;

Select pizza_category, SUM(total_price) *100/ (select SUM( total_price) from pizza_sales) as Percent_Total_sales 
from pizza_sales
group by pizza_category;

Select pizza_category, CAST(SUM(total_price) *100/ (select SUM( total_price) from pizza_sales) as decimal(10,2))as Percent_Total_sales 
from pizza_sales
group by pizza_category;


Select pizza_size, CAST(SUM(total_price) *100/ (select SUM( total_price) from pizza_sales) as decimal(10,2))as Percent_Total_sales 
from pizza_sales
group by pizza_size
Order by Percent_Total_sales DESC;


Select pizza_size, CAST(SUM(total_price) *100/ (select SUM( total_price) from pizza_sales where DATEPART(quarter, order_date)=3) as decimal(10,2))as Percent_Total_sales 
from pizza_sales
where DATEPART(quarter, order_date)=3
group by pizza_size
Order by Percent_Total_sales DESC;


Select pizza_category, SUM(quantity) as Total_Quantity_Sold
from pizza_sales
group by pizza_category
Order by Total_Quantity_Sold DESC;

Select pizza_name, SUM(quantity) as Total_Quantity
From pizza_sales
Group by pizza_name
Order By Total_Quantity Desc;

Select Top 5 pizza_name, SUM(quantity) as Total_Quantity
From pizza_sales
Group by pizza_name
Order By Total_Quantity Desc;


Select Top 5 pizza_name,SUM(total_price) as Total_Revenue 
from pizza_sales
Group by pizza_name
Order By Total_Revenue Desc;

Select Top 5 pizza_name, COUNT(distinct order_id) as Total_Orders_Placed
from pizza_sales
Group by pizza_name
Order By Total_Orders_Placed Desc;

Select Top 5 pizza_name, SUM(quantity) as Total_Quantity
From pizza_sales
Group by pizza_name
Order By Total_Quantity Asc;


Select Top 5 pizza_name,CAST(SUM(total_price) as decimal(10,2)) as Total_Revenue
from pizza_sales
Group by pizza_name
Order By Total_Revenue Asc;


Select Top 5 pizza_name, COUNT(distinct order_id) as Total_Orders_Placed
from pizza_sales
Group by pizza_name
Order By Total_Orders_Placed Asc;