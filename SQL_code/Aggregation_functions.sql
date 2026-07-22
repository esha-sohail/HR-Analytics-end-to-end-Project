--level 2
--AGGREGATE FUNCTIONS

--How many employees are currently in the HR database?
select count(*) as total_employees
from employee_attrition;

--How is our workforce distributed?
select department, count(*) as total_employees
from employee_attrition
group by department
order by total_employees;

 --What is the average employee salary?
 select avg(monthly_income) as avg_salary
 from  employee_attrition;

--What is the salary range?
select
max(monthly_income) as highest_salary,
min(monthly_income) as lowest_salary
from employee_attrition;

--What is the average age of employees?\
select avg(age) as avg_age
from employee_attrition;

--How many employees resigned?
select count(*) as employee_resigned
from employee_attrition
where attrition='Yes';

--Calculate the attrition rate.
SELECT
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*)
     AS attrition_rate
FROM employee_attrition;


--What is the average employee tenure?
select avg(years_at_company) as avg_tenture
from employee_attrition;  

--Which departments pay the highest salaries?
SELECT
    department,
    AVG(monthly_income) AS average_salary
FROM employee_attrition
GROUP BY department
ORDER BY average_salary DESC;

--Which job roles earn the highest salaries?
SELECT
    job_role,
    AVG(monthly_income) AS average_salary
FROM employee_attrition
GROUP BY job_role
ORDER BY average_salary DESC;
