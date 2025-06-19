use office1;
#Q1. Write a query to get Employee and Department details using join. 
select e.emp_name,d.department_name from employee e
join department d
on d.department_id=e.department_id;

#Q2. Write a query to retrieve all employees with their departments, even if the department is missing.
select e.emp_name,d.department_name from employee e
left join department d
on d.department_id=e.department_id;

#Q3. Write a query to get department details even if there are no employees in that department. 
select e.emp_name,d.department_name from employee e
right join department d
on d.department_id=e.department_id;

#Q4. Write a query to get all employees and departments, whether matched or not. 
SELECT e.emp_id, e.emp_name, d.department_id, d.department_name
 FROM employee e
 LEFT JOIN department d ON e.department_id = d.department_id
UNION
SELECT e.emp_id, e.emp_name,d.department_id, d.department_name
 FROM employee e
 RIGHT JOIN department d ON e.department_id = d.department_id;
 
#Q5. JOIN three tables (Employees, Departments, Projects) to get employee, department, and project information
select e.emp_name,d.department_name,p.project_name from employee e
inner join department d
on d.department_id=e.department_id
inner join project p
on p.emp_id=e.emp_id;
 
#6. Find employees who are not assigned to any projects.
select e.emp_name,p.project_name from employee e
left join project p
on p.emp_id=e.emp_id
where project_name is null;

#Q7. Find departments with no employees using a RIGHT JOIN. 
select d.department_name,e.emp_name from employee e
right join department d
on d.department_id=e.department_id
where e.emp_name is null;

#Q8. Write a query to get Employee and Department details using join with aliases. 
select e.emp_name as emp_name ,d.department_name as dept_name from employee e
inner join department d
on d.department_id=e.department_id;

#Q9. Write a query to find projects managed by employees in the 'IT' department. 
select e.emp_name,d.department_name,p.project_name from employee e
inner join department d
on d.department_id=e.department_id
inner join project p
on p.emp_id=e.emp_id
where department_name='IT';

#Q10. Write a query to show employees and their project information (even if not assigned to a project). 
select e.emp_name,p.project_name from employee e
left join project p
on p.emp_id=e.emp_id;

#Q11. Find employees who work in departments with names starting with 'A'. 
select e.emp_name,d.department_name from employee e
inner join department d
on d.department_id=e.department_id
where emp_name like 'A%';

#Q12. Find the total number of employees in each department using GROUP BY and JOIN. 
select d.department_name,count(e.emp_name) as total_emp from employee e
inner join department d
on d.department_ID=e.department_ID
group by department_name;

#Q13. Get the list of departments with more than one employee. 
select d.department_name,count(e.emp_name) as Emp_count from department d
inner join employee e
on e.department_ID=d.department_ID
group by d.department_name
having count(e.emp_name)>1;