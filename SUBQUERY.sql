#SUBQUERY
USE SUBQUERY;

#Q-1 Find names and salaries of employees earning more than an employee with last_name='Bull'.
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Bull');

#Q-2 Select employees from the department with deptid = 1.
SELECT * 
FROM Employee 
WHERE department = (SELECT department FROM Departments WHERE deptid = 1);

#Q-3 Find employees whose salary is less than the average salary in the company.
SELECT * 
FROM Employee 
WHERE salary < (SELECT AVG(salary) FROM Employee);

#Q-4 Find employees whose salary is greater than or equal to the average salary by their department (correlated subquery).
SELECT empid, name 
FROM Employee AS A 
WHERE salary >= (SELECT AVG(salary) FROM Employee AS B WHERE A.department = B.department);

#Q-5 Select all employees whose department is in the Departments table (using IN operator).
SELECT * 
FROM Employee 
WHERE department IN (SELECT department FROM Departments);

#Q-6 Retrieve employee details for those whose department does not exist in Departments table (using NOT IN).
SELECT * 
FROM Employee 
WHERE department NOT IN (SELECT department FROM Departments);

#Q-7 Find employees where there exists at least one matching department (using EXISTS).
SELECT empid, name 
FROM Employee 
WHERE EXISTS (SELECT 1 FROM Departments WHERE Departments.department = Employee.department);

#Q-8 Find employees where there does not exist a matching department (using NOT EXISTS).
SELECT empid, name 
FROM Employee 
WHERE NOT EXISTS (SELECT 1 FROM Departments WHERE Departments.department = Employee.department);

#Q-9 Using a subquery in FROM clause to select departments from Employee table.
SELECT department 
FROM (SELECT * FROM Employee) AS A;

#Q-10 Find customers who have placed more than 5 orders (subquery in SELECT clause).
SELECT customer_name, 
       (SELECT COUNT(order_id) FROM orders WHERE orders.customer_id = customers.customer_id) AS order_count
FROM customers
WHERE (SELECT COUNT(order_id) FROM orders WHERE orders.customer_id = customers.customer_id) > 5;


#Q-9 
