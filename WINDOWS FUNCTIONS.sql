#WINDOWS FUNCTIONS
USE WINDOWS;
#Q-1 Rank employees by salary in descending order.
SELECT employee_id, department, salary,
  RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM Employees;

#Q-2 Calculate running total of sales by month.
SELECT month, sales,
  SUM(sales) OVER (ORDER BY month) AS running_total
FROM SalesData;

#Q-3 Partition employees by department and rank them by salary within each department.
SELECT employee_id, department, salary,
  DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank
FROM Employees;

#Q-4 Calculate 3-month moving average of sales.
SELECT month, sales,
  AVG(sales) OVER (ORDER BY month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM SalesData;

#Q-5 Find the difference between the current salary and previous salary for each employee.
SELECT employee_id, salary,
  salary - LAG(salary) OVER (ORDER BY employee_id) AS salary_diff
FROM Employees;

#Q-6 Calculate cumulative percentage of total sales by month.
SELECT month, sales,
  SUM(sales) OVER (ORDER BY month) * 100.0 / SUM(sales) OVER () AS cumulative_pct
FROM SalesData;

#Q-7 Find top 3 highest paid employees in each department.
WITH RankedEmployees AS (
  SELECT employee_id, department, salary,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rn
  FROM Employees
)
SELECT employee_id, department, salary
FROM RankedEmployees
WHERE rn <= 3;

#Q-8 Calculate salary difference from department average.
SELECT employee_id, department, salary,
  salary - AVG(salary) OVER (PARTITION BY department) AS diff_from_dept_avg
FROM Employees;

#Q-9 Find first and last sale date for each customer.
SELECT customer_id,
  FIRST_VALUE(sale_date) OVER (PARTITION BY customer_id ORDER BY sale_date) AS first_sale,
  LAST_VALUE(sale_date) OVER (PARTITION BY customer_id ORDER BY sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_sale
FROM Sales;

#Q-10 Calculate percentage of total sales for each product.
SELECT product_id, sales,
  sales * 100.0 / SUM(sales) OVER () AS pct_of_total_sales
FROM ProductSales;


