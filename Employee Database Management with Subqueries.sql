create database company;

use company;

create table employees(emp_id int primary key, emp_name varchar(50), department varchar(50), salary int, manager_id int);

insert into employees(emp_id,emp_name,department,salary,manager_id) values
(1,"Arjun","HR",40000,Null),
(2,"Neha","IT",65000,5),
(3,"Rohan","IT",55000,5),
(4,"Meera","Finance",70000,Null),
(5,"Suresh","IT",90000,4),
(6,"Alia","HR",45000,1),
(7,"Karan","Finance",75000,4),
(8,"Rahul","Marketing",30000,Null),
(9,"Priya","Marketing",35000,8),
(10,"Varun","IT",50000,5);

select * from employees;

#Q1.List employees earning more than the average salary.
select emp_name, salary from employees
where salary > (select avg(salary) from employees);

#Q2. Find employees who earn the maximum salary.
select emp_name, salary from employees
where salary = (select max(salary) from employees);

#Q3. Find employees working in the same department as ‘Neha’.
select emp_name, department from employees
where department = (select department from employees where emp_name = "Neha");

#Q4. List employees whose salary is higher than Suresh’s salary.
select emp_name, salary from employees
where salary > (select salary from employees where emp_name = "Suresh");

#Q5. Show departments where the minimum salary is less than 40,000.
select department, salary from employees
where salary in (select min(salary) from employees where salary < 40000 group by department);

#Q6. Find employees who do not have a manager.
select emp_name, manager_id from employees
where emp_id in (select emp_id from employees
where manager_id is null);

#Q7. Find employees who report to the same manager as Rohan.
select emp_name, manager_id from employees
where manager_id = (select manager_id from employees
where emp_name = "Rohan");

#Q8. List employees in IT with salary above the IT average.
select emp_name, department, salary
from employees
where salary > (select avg(salary) from employees
where department = "IT") and department = "IT";

#Q9. Show employees whose salary is in the bottom 3.
select emp_name, salary from employees
where salary in (select salary from (select distinct salary 
from employees order by salary limit 3)as tS);

#Q10. Show employees whose salary is within the top 3.
select emp_name, salary from employees
where salary in (select salary from (select distinct salary 
from employees order by salary DESC limit 3)as tS);

#Q11. Find employees earning more than HR department average salary.
select emp_name, salary from employees
where salary > (select avg(salary) from
employees where department = "HR");

#12. List employees having the same salary as Priya.
select emp_name, salary from employees
where salary = (select salary from employees
where emp_name = "Priya");

#Q13. Count employees who earn below overall average.
select count(*) from employees
where salary < (select avg(salary) from employees);

#Q14. Show employees whose manager earns more than 70,000.
select emp_name, manager_id from employees
where manager_id in (select emp_id from employees
where salary > 70000);

#Q15. Display employees in departments where more than 2 employees work.
select emp_name, department from employees
where department = (select department from employees
group by department
having count(*) > 2);

#Q16. Show departments where the average salary is above company average.
select department, avg(salary) as Average_salary from employees
group by department
having Average_salary > (select avg(salary) from employees);

#Q17. Find the 2nd highest salary.
select emp_name, salary from employees
where salary = (select max(salary) from employees
where salary < (select max(salary) from employees));

#Q18. Employees with salary greater than the average salary of their manager’s team.
select emp_name, salary from employees
where salary > (select avg(salary) from employees
where emp_id in (select manager_id from employees
where manager_id is not null)); 

#Q19. Show employees who work in a department where Suresh works.
select emp_name, department from employees
where department = (select department from employees
where emp_name = "Suresh");

#Q20. List employees whose manager earns the maximum salary.
select emp_name from employees
where manager_id = (select emp_id from employees
where salary = (select max(salary) from employees
where emp_id in (select manager_id from employees
where manager_id is not null)));

#Q21. Show employees whose salaries appear more than once.
select emp_name, salary from employees 
where salary in (select salary from employees
group by salary
having count(*) > 1);

#Q22. List employees earning less than the minimum IT salary.
select emp_name, salary from employees
where salary < (select min(salary) from employees 
where department = "IT");

#Q23. Show employees with salary higher than Finance average salary.
select emp_name, salary from employees
where salary > (select avg(salary) from employees
where department = "Finance");

#Q24. Find employees earning exactly the 3rd highest salary.
select emp_name, salary from employees
where salary = (select max(salary) from employees
where salary < (select max(salary) from employees
where salary < (select max(salary) from employees)));

#Q25. List employees having salary in the same salary group as Meera’s department.S
select emp_name, department, salary from employees 
where department = (select department from employees
where emp_name = "Meera");