create database office1;
use office1;
#Q-1. Find the average salary of employees in each department. 
select avg(salary),department 
from employee1 
group by department;

#Q-2. Find the total number of employees hired after 2019. 
select count(first_name) as Total_emp 
from employee1 
where year(hire_date)>2019;

#Q-3. List the departments and the total salary of all employees in each department, ordered by the total salary.
select department,sum(salary) as Total_salary 
from employee1 
group by department 
order by sum(salary)desc;

#Q-4. Find the highest salary in the Finance department.
select department,max(salary) as Highest_salary 
from employee1 
where department ='Finance';

#Q-5. Get the top 3 highest-paid employees.
select first_name,last_name,salary 
from employee1 
order by salary desc 
limit 3;

#Q-6. Find the department with the minimum average salary. 
select department,avg(salary) as avg_salary from employee1 
group by department limit 1;

#Q7. Display the total number of employees in each department, ordered by the number of employees.
select department,count(emp_id) as Total_emp from employee1 
group by department 
order by count(emp_id)desc ;

#Q8. Find the average salary of employees who were hired before 2020.
SELECT first_name,avg(salary) AS average_salary
FROM employee1
WHERE year(hire_date) < '2020' 
group by first_name;

#Q9. List the names of employees in the IT department ordered by hire date, with the most recently hired employees first. 
select first_name,hire_date from employee1
where department='IT' 
order by hire_date desc;

#Q10. Find the sum of salaries for all employees hired after January 1, 2019, ordered by salary.
select sum(salary) as total_salary from employee1 
where hire_date>'2019-01-01';

#Q11. Get the employee with the lowest salary in the HR department. 
select first_name, salary from employee1 
where department='HR' 
order by salary asc limit 1;

#Q12. Find the total salary paid to employees in each department, but limit the result to the top 2 highest-paying departments.
select department,sum(salary) as total_salary from employee1 
group by department 
order by sum(salary) desc limit 2;

#Q13. List all employees hired after 2018, ordered by salary, and show only the first 4 employees.  
select first_name,salary,hire_date from employee1 
where year(hire_date)>'2018' 
order by hire_date desc limit 4;

#Q14. Find the highest salary in the IT department, but limit the results to the top 1 result.   
select first_name,salary from employee1 
where department='IT' 
order by salary desc limit 1;

#15. Get the average salary of employees in each department and list only departments with an average salary greater than $60,000.  
select department,avg(salary) as Average_Salary from employee1 
where salary>60000 
group by department;