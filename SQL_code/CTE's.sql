--CTE's
--Common Table Expressions (CTEs)
--A CTE creates a temporary named result set that can be reused in the main query.


--Find Average Salary by Department Using a CTE

with department_salary AS 
  (select department,
          avg(monthly_income) as avg_salary
	from employee_attrition
	group by department)
select *
from department_salary
order by avg_salary ;

--Calculate Attrition Rate by Department

WITH department_attrition AS
(
    SELECT
        department,
        COUNT(*) AS total_employees,
        COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left
    FROM employee_attrition
    GROUP BY department
)

SELECT
    department,
    total_employees,
    employees_left,   --sales dep has highest attrition rate
    ROUND(
        employees_left * 100.0 / total_employees,2)
        AS attrition_rate
FROM department_attrition
ORDER BY attrition_rate DESC;


--Find the Highest Paying Department

with department_salary as 
(
select department,
avg(monthly_income) as avg_salary
from employee_attrition
group by department
)
select * 
from department_salary        -- sales department is highest paying
order by avg_salary desc
limit 1;

--Find Each Employee's Salary Difference from the Department Average

WITH department_salary AS
(
    SELECT
        department,
        AVG(monthly_income) AS average_salary
    FROM employee_attrition
    GROUP BY department
)  --Positive values indicate employees earning
--above the department average; negative values indicate below-average earners.

SELECT
    e.employee_number,
    e.department,
    e.monthly_income,
    ROUND(d.average_salary,2) AS department_average,
    ROUND(e.monthly_income - d.average_salary,2) AS salary_difference
FROM employee_attrition e
JOIN department_salary d
ON e.department = d.department

--Find Employees with Above-Average Experience Within Their Department

WITH department_experience AS
(
    SELECT
        department,
        AVG(total_working_years) AS avg_experience
    FROM employee_attrition
    GROUP BY department
)

SELECT
    e.employee_number,
    e.department,
    e.total_working_years,
    ROUND(d.avg_experience,2) AS department_average
FROM employee_attrition e
JOIN department_experience d
ON e.department = d.department
WHERE e.total_working_years > d.avg_experience
ORDER BY e.department, e.total_working_years DESC; --These employees may be strong candidates for
--mentoring, leadership roles, or succession planning.

