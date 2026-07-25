
--Part 4: Window Functions
--row_number
--Assign Row Numbers Based on Salary Within Each Department
select 
employee_number, department,monthly_income,job_role,
row_number()over( partition by department
                  order by monthly_income desc) as salary_rank
	from employee_attrition;			  


--Find the Top 3 Highest-Paid Employees in Each Department
WITH ranked_employees AS (
    SELECT
        employee_number,
        department,
        job_role,
        monthly_income,
        ROW_NUMBER() OVER (
            PARTITION BY department
            ORDER BY monthly_income DESC
        ) AS salary_rank
    FROM employee_attrition
)

SELECT *
FROM ranked_employees
WHERE salary_rank <= 3
ORDER BY department, salary_rank;

--Rank Employees by Monthly Salary
--dense_rank()

select department,
employee_number,
monthly_income,
dense_rank() over(order by monthly_income desc)
as salary_rank
from employee_attrition;

--Rank Departments by Average Salary
 with department_salary as (
select department,
avg(monthly_income) as avg_salary
from employee_attrition
group by department)

 select avg_salary,
 department,
 dense_rank() over(order by avg_salary desc) as dep_rank
 from department_salary;  


 --Rank Job Roles by Average Salary
 with dep_salary as( 
 select
 job_role,
 avg(monthly_income) as avg_salary
 
 from employee_attrition
 group by job_role
 )
 select job_role,avg_salary,
 dense_rank() over (order by avg_salary desc) as job_rank
 from dep_salary;  

 --NTILE() divide data into quartiles or more based on number we use in ntile
 --Divide Employees into Four Salary Quartiles
 select employee_number,department,monthly_income,
 NTILE(4) over(order by monthly_income desc) as salary_rank
 from employee_attrition;
 --Business Insight
--Quartile 1 = Highest-paid employees
--Quartile 4 = Lowest-paid employees



--how many employees are in each quartile

WITH salary_quartiles AS (
    SELECT
        employee_number,
        monthly_income,
        NTILE(4) OVER (
            ORDER BY monthly_income DESC
        ) AS salary_quartile
    FROM employee_attrition
)

SELECT
    salary_quartile,
    COUNT(*) AS total_employees
FROM salary_quartiles
GROUP BY salary_quartile
ORDER BY salary_quartile;

--lag() and lead()

--Compare Employee Salary with the Previous Employee in the
 select employee_number,
 department,
 monthly_income,
 LAG(monthly_income) over(order by monthly_income desc)
 as previous_rank
 from employee_attrition;

 --Compare Employee Salary with the Next Employee
  select employee_number,
 department,
 monthly_income,
 Lead(monthly_income) over(order by monthly_income desc)
 as next_rank
 from employee_attrition;


--first_value and last_value
--Show the Highest Salary in Every Department

  select employee_number,
 department,
 monthly_income,
first_value(monthly_income) over(partition by department 
order by monthly_income desc)
 as highest_value
 from employee_attrition;

 --Show the Lowest Salary in Every Department
 select employee_number,
 department,
 monthly_income,
last_value(monthly_income) over(partition by department 
order by monthly_income desc
ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING)
 as lowest_value
 from employee_attrition;  


 --Calculate Cumulative Salary by Department
 select employee_number,
 department,
 monthly_income,
sum(monthly_income) over(partition by department 
order by monthly_income desc)
 as cummulative_salary
 from employee_attrition;

 

 --Show Department Average Salary Beside Every Employee
--Business Question
--Compare each employee's salary with the average salary of their department.

SELECT
    employee_number,
    department,
    monthly_income,
    ROUND(
        AVG(monthly_income) OVER (
            PARTITION BY department
        ),
        2
    ) AS department_average
FROM employee_attrition;


--Show the Number of Employees in Each Department Beside Every Employee
--Business Question

--How many employees work in the same department as each employee?

SELECT
    employee_number,
    department,
    job_role,
    COUNT(*) OVER (
        PARTITION BY department
    ) AS department_employee_count
FROM employee_attrition;