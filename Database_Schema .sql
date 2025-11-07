#QUE.1 Create a database named company and a table named employees with the following fields:
create database company;

use company;

create table employee(id int primary key auto_increment, name varchar(100), position varchar(100), salary decimal(10,2), date_of_joining date);

#QUE.2 Insert the following data into the employee table:
Insert into employee(name,position,salary,date_of_joining) values
("John Doe","Manager",55000.00,"2020-01-15"),
("Jane Smith","Developer",48000.00,"2019-07-10"),
("Alice Johnson","Designer",45000.00,"2021-03-22"),
("Bob Brown","Developer",50000.00,"2018-11-01");

select * from employee;

#QUE.3 Write a query to retrieve all employees who are Developers.
 Select * from employee where position = "Developer";
 
 #QUE.4 Write a query to update the salary of Alice Johnson to 46000.00.
 Update employee
 set salary = 46000.00
 where name = "Alice Johnson";
 
 select * from employee;
 
#QUE.5 Write a query to delete the employee record for Bob Brown.
Delete from employee
where name = "Bob Brown";

select * from employee;

#QUE.6 Write a query to find the employees who have a salary greater than 48000.
Select * from employee
where salary > 48000;

#QUE.7 Write a query to add a new column email to the employees table.
Alter table employee add column email varchar(100);

select * from employee;

#QUE.8 Write a query to update the email for John Doe to john.doe@company.com. 
Update employee
set email = "john.doe@company.com"
where name = "John Doe";

select * from employee;

#QUE.9 Write a query to retrieve only the name and salary of all employees.
Select name,salary
from employee;

#QUE.10 Write a query to count the number of employees who joined after January 1, 2020.
select count(name) as "Number_of_employees" from employee
where date_of_joining > "2020-01-01";

#QUE.11 Write a query to order the employees by salary in descending order.
select * from employee order by  salary DESC;

#QUE.12 Write a query to drop email column from the employees table.
Alter table employee drop column email;

select * from employee;

#QUE.13 Write a query to find the employee with the highest salary.
select * from employee
where salary = (Select max(salary) from employee);
