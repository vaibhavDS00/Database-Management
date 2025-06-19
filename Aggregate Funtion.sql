create database product;
use product;
#Q1. Write a query to calculate the total sales (Quantity * UnitPrice) for each product.
select productID,sum(quantity*unitprice) as Total_sales from sales group by productID;

#Q2. Write a query to find the total number of products sold in each region.
select region,sum(quantity) from sales group by region;

#Q3. Write a query to get the average sales amount per product. 
select productid,avg(unitprice) as avg_price from sales group by productid;

#Q4. Find the regions where total sales are more than 3000. 
select region,sum(quantity*unitprice) as Total_sales from sales 
group by region
having total_sales>3000;

#Q5. Write a query to get the maximum quantity sold for each product.
select productid,max(quantity) as total_sold from sales group by productid order by total_sold desc;

#Q6. Write a query to calculate the average quantity of products sold per region.
select region,avg(quantity) as average_quantity from sales group by region;

#Q7. Find the product IDs that have generated a total sales amount of more than 1000.
select productID,sum(quantity*unitprice) as Total_sales from sales group by productid having total_sales>1000;

#Q8. Write a query to get the total number of sales (rows) made for each customer.
select customerid,count(customerid) as count_row from sales group by customerid;

#Q9. Find the products for which the average quantity sold is less than 5. 
select productid,avg(quantity) as avg_quantity from sales group by productid having avg_quantity<5;

#Q10. Write a query to find the sum of total sales for each customer in each region. 
select customerid,region,sum(quantity*unitprice) as Total_sales from sales group by customerid,region;

####Q11. Write a query to calculate the total sales for each month. 
select month(saledate) as month,sum(quantity*unitprice) as Total_sales from sales group by month(saledate);

#Q12. Find the regions where the average unit price is more than 200. 
select region,avg(unitprice) as avg_uprice from sales group by region having avg_uprice>200;

#Q13. Write a query to get the minimum and maximum quantity sold per region.
select region,min(quantity) as minQ,max(quantity) as maxQ from sales group by region;

#Q14. Find the customers who have made more than 1 purchases.
select customerid,count(quantity) as Purchases from sales group by customerid having purchases>1;

#Q15. Write a query to find the total sales for each product and filter only those products where the total sales exceed 1500.  
select productID,sum(quantity*unitprice) as Total_sales from sales group by productid having total_sales>1500;

 