/*Q-1 Create a database named company and a table named employees with the following fields:
id (INT, Primary Key, Auto Increment)
name (VARCHAR(100))
position (VARCHAR(100))
salary (DECIMAL(10,2))
date_of_joining (DATE) */
create database company;
use company;

create table employees(
id INT Primary Key Auto_Increment,
name VARCHAR(100),
position VARCHAR(100),
salary DECIMAL(10,2),
date_of_joining DATE
);

/*Q-2  Insert the following data into the employees table:
John Doe, Manager, 55000.00, 2020-01-15
Jane Smith, Developer, 48000.00, 2019-07-10
Alice Johnson, Designer, 45000.00, 2021-03-22
Bob Brown, Developer, 50000.00, 2018-11-01 */
insert into employees(id,name,position,salary,date_of_joining)
values (1,'John Doe', 'Manager', 55000.00, '2020-01-15'),
		(2,'Jane Smith', 'Developer', 48000.00, '2019-07-10'),
		(3,'Alice Johnson', 'Designer', 45000.00, '2021-03-22'),
		(4,'Bob Brown', 'Developer', 50000.00, '2018-11-01');
select * from employees;
# Q-3 Write a query to retrieve all employees who are Developers.
select * from employees where position='developer';

# Q-4 Write a query to update the salary of Alice Johnson to 46000.00.
SET SQL_SAFE_UPDATES=0;
update employees set salary=46000.00where name='Alice Johnson';
select*from employees;

# Q-5 Write a query to delete the employee record for Bob Brown.
delete from employees where name='Bob Brown';
select*from employees;

# Q-6 Write a query to find the employees who have a salary greater than 48000.
select * from employees where salary>48000;

# Q-7 Write a query to add a new column email to the employees table.
alter table employees
add email varchar(50);
select * from employees;

# Q-8 Write a query to update the email for John Doe to john.doe@company.com.
update employees
set email='john.doe@company.com' where name='John Doe';
select*from employees;

# Q-9 Write a query to retrieve only the name and salary of all employees .
select name,salary from employees;

# Q-10 Write a query to count the number of employees who joined after January 1, 2020.
select count(id) from employees where date_of_joining>'2020-1-1';

# Q-11 Write a query to order the employees by salary in descending order.
select * from employees order by salary desc;

# Q-12 Write a query to drop the email column from the employees table.
alter table employees
drop column email;
select * from employees;

# Q-13 Write a query to find the employee with the highest salary.
SELECT name, salary FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
