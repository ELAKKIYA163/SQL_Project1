create database employee;
-- drop database employee;
use employee;
create table employeeEMP(employee_ID int, 
first_name varchar(50),
last_name varchar(20),
salary varchar(10),
joining_date varchar(20),
department varchar(20),
primary key (employee_ID)
);

create table incentive(
employee_ref_ID int,
incentive_data varchar(20),
incentive_amt varchar(10),
foreign key(employee_ref_ID) references employeeEmp(employee_ID)
);

show tables;
select * from employeeEmp;
select * from incentive;

insert into employeeEMP(employee_ID, first_name, last_name, salary, joining_date, department)values
(1, 'Venkatesh', 'S', '100000', '08/28/2015', 'Banking'),
(2, 'Ragavi', 'P', '75000', '08/28/2015', 'Business'),
(3, 'Gopinath', 'C', '50000', '03/02/2016', 'Pharma'),
(4, 'Dinesh', 'G', '50000', '03/02/2016', 'Insurance'),
(5, 'Saibabu', 'E', '40000', '07/08/2017', 'Software'),
(6, 'Hasan', 'S', '29000', '07/08/2017', 'Manufacturing'),
(7, 'Divya', 'P', '33000', '07/08/2017', 'Healthcare'),
(8, 'Aravindan', 'R', '40000', '07/08/2017', 'Healthcare'),
(9, 'Sathish', 'MD', '45000', '03/02/2016', 'Automobile'),
(10, 'Prasanth', 'PKP', '34000', '03/02/2016', 'Insurance'),
(11, 'Vijay', 'R', '25684', '03/02/2016', 'Business'),
(12, 'Sivakumar', 'K', '54789', '03/02/2016', 'Software');

insert into incentive(employee_ref_ID, incentive_data, incentive_amt)values
(1, '01-feb-16', '5000'),
(2,'01-feb-16', '3000'),
(3, '01-feb-17', '4000'),
(1, '01-jan-17', '4500'),
(2, '01-jan-17', '3500');

-- 1.Get all the employee details from the employee table
select * from employeeEmp;

-- 2.Get first_name, last_name from the employee table
select first_name, last_name from employeeEmp;

-- 3.Get first_name from employee table using alice name "Employee name"
select first_name as Employee_name from employeeEmp;
 
 -- 4.Get first_name from employee table in upper case
 select upper(first_name) from employeeEmp;
 
 -- 5.Get first_name from employee table in lower case
 select lower(first_name) from employeeEmp;
 
  -- 6.Get unique department from employee table
 select distinct department from employeeEmp; 
 
 -- 7.select first 3 charcter of first_name from employee 
 select left(first_name, 3) from employeeEmp;
 
 -- 8.Get positon of 'a' in name 'Ragavi' from employee table
select position('a' in 'Ragavi') as position_of_a;

-- 9.Get first_name form employee table after removing with white space from right side
select rtrim(first_name) as first_name from employeeEmp;

-- 10.Get first_name form employee table after removing with white space from left side
select ltrim(first_name) as first_name from employeeEmp;

-- 11.Get length of the first_name from employee table
select length(first_name) from employeeEmp;

-- 12.Get first_name employee table after replacing 'a' with '$'
select replace(first_name, 'a', '$') as modified_first_name from employeeEmp;

-- 13.Get the first_name and last_name as single column from employee table separated by a '_'
select concat(first_name, '_', last_name) as full_name from employeeEmp;

-- 14.Get first_name, joining year, joining month and joining date from employee table
select first_name,
substring(joining_date, 7, 4) as joining_year,
substring(joining_date, 1, 2) as joining_month,
substring(joining_date, 4, 2) as joining_date_day
from employeeEmp;

-- 15.Get all employee details from the employee table order by first_name ascending 
select * from employeeEmp order by first_name asc;

-- 16.Get all employee details from the employee table order by first_name decending 
select * from employeeEmp order by first_name desc;

-- 17.Get all employee details from the employee table order by first_name ascending and salary decending 
select * from employeeEmp order by first_name asc, salary desc;

-- 18.Get employee details from employee table whose employe name is "Dinesh"
select * from employeeEmp where first_name = 'Dinesh';

-- 19.Get employee details from employee table whose employe name are "Dinesh" and "Roy" 
select * from employeeEmp where first_name in ('Dinesh', 'Roy');

-- 20.Get employee details from employee table whose employe name are not "Dinesh" and "Roy"
select * from employeeEmp where first_name not in ('Dinesh', 'Roy');

-- 21.Get employee details from employee table whose first_name starts with 'S'
 select * from employeeEmp where first_name like 'S%';
 
 -- 22.Get employee details from employee table whose first_name contains 'v'
 select * from employeeEmp where first_name like '%v%';
 
 -- 23.Get employee details from employee table whose first_name ends with 'n'
  select * from employeeEmp where first_name like '%n';
  
 -- 24.Get employee details from employee table whose first_name ends with 'n' and name contains 4 letters
 select * from employeeEmp where first_name like '_n' and length(first_name)=4;
 
-- 25.Get employee details from employee table whose first_name starts with 'J' and name contains 4 letters
 select * from employeeEmp where first_name like 'J_' and length(first_name)=4;

-- 26.Get employee details from employee table whose salary greater than 60000
select * from employeeEmp where salary > 60000;

-- 27.Get employee details from employee table whose salary less than 80000
select * from employeeEmp where salary < 80000;

-- 28.Get employee details from employee table whose salary between 50000 and 80000
select * from employeeEmp where salary between 50000 and 80000;

-- 29.Get employee details from employee table whose name is Venkatesh and Ragavi
select * from employeeEmp where first_name in ('Venkatesh', 'Ragavi');

-- 39.Get employee details from employee table who has '%' in last_name.
select * from employeeEmp where INSTR(last_name, '%') > 0;

-- 40.Get employee details from employee table after replacing special character with white space 
select REPLACE(REPLACE(first_name, '@', ' '), '#', ' ') AS first_name,
  REPLACE(REPLACE(last_name, '@', ' '), '#', ' ') AS last_name
FROM employeeEmp;

-- 41.Get department, total salary with respect to a department from table
select department, SUM(salary) as total_salary from employeeEmp group by department;

-- 42.Get department, total salary with respect to a department from employee table order by total salary decending 
select department, SUM(salary) as total_salary from employeeEmp group by department order by total_salary desc;

-- 43.Get department, no of employee in a department, total salary with respect to a department from employee table order salary descending 
select department, COUNT(*) as num_employees, SUM(salary) as total_salary from employeeEmp group by department order by total_salary DESC;

-- 44.Get department wise average salary from employee table order by salary ascending 
select department, avg(salary) as average_salary from employeeEmp group by department order BY average_salary asc;

-- 45.Get department wise maximum salary from employee table order by salary ascending 
select department, MAX(salary) as max_salary from employeeEmp group by department order by max_salary asc;

-- 46.Get department wise minimum salary from employee table order by salary ascending 
select department, MIN(salary) as min_salary from employeeEmp group by department order by min_salary asc;

-- 47.Select no of employee joined with respect to year and month from employee table
select DATE_FORMAT(joining_date, '%Y-%m') as join_year_month, 
  COUNT(*) as num_employees from employeeEmp group by DATE_FORMAT(joining_date, '%Y-%m') order by join_year_month;
  
  -- 48.Select department, total salary with respect to a department from employee table where total salary salary greater than 80000 total_salary descending
select  department, SUM(salary) as total_salary from employeeEmp
group by department having SUM(salary) > 80000 order by total_salary desc;

-- 49.select first_name incentive amount from employee and incentive table for those employees who have incentives
select e.first_name, i.incentive_amt from employeeEmp e join incentive i on e.employee_id = i.employee_ref_ID;

-- 50.Select first_name, incentive amount from employee and incentives table for those employee who have incentives and incetive greater than 3000
select e.first_name, i.incentive_amt from employeeEmp e join incentive i on e.employee_id = i.employee_ref_ID where i.incentive_amt > 3000;

-- 51.Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives 
select e.first_name, i.incentive_amt from employeeEmp e left join incentive i on e.employee_id = i.employee_ref_ID;

-- 52.Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives incentive amount as 0 for those employees who didn't get incentives
select e.first_name, 
IFNULL(i.incentive_amt, 0) as incentive_amt 
from employeeEmp e left join incentive i
on e.employee_id = i.employee_ref_ID;

-- 53.Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join
SELECT e.first_name, i.incentive_amt
FROM employeeEmp e left join incentive i
on e.employee_id = i.employee_ref_ID
where i.incentive_amt is not null;

-- 54.Select max incentive with respect to employee from employee and incentiive table using sub query 
select e.first_name, (SELECT MAX(i.incentive_amt) from incentive i 
   where i.employee_ref_ID = e.employee_id) as max_incentive
FROM employeeEmp e;

-- 55.Select top 2 salary from employee table
select * from employeeEmp order by salary  desc limit 2;

-- 56.Select top N salary from employee table
set @N = 5; prepare stmt from 'SELECT salary FROM employeeEmp ORDER BY salary desc LIMIT ?';
execute stmt using @N; deallocate prepare stmt;

-- 57.Select 2nd Highest salary from employee table
select distinct salary from employeeEmp order by salary desc limit 1 offset 1;

-- 58.Select Nth Highest salary from employee table
set @N = 3; set @offset = @N - 1;
prepare stmt from 'SELECT DISTINCT salary FROM employeeEmp ORDER BY salary DESC LIMIT 1 OFFSET ?';
execute stmt using @offset;
deallocate prepare stmt;





