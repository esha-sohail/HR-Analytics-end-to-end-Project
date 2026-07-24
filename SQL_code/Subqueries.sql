
--HR Analytics SQL Project
--Part 3: Subqueries & CTEs
--Find Employees Earning Above the Company Average Salary
select employee_number,department,monthly_income
from employee_attrition
where monthly_income >
(
 select avg(monthly_income) 
as avg_income
from employee_attrition)
order by monthly_income desc;   --Business Insight
--HR can identify high earners for compensation analysis.



-- Find Employees Older Than the Average Employee Age
--Business Question
--Which employees are older than the average workforce age?

select employee_number,age      --outer_query
from employee_attrition
where age >
(select avg(age)      --subquery
from employee_attrition)
order by age desc;


--Find Departments with Above-Average Salaries
--Business Question
--Which departments pay more than the company's average salary?

select department ,avg(monthly_income) as avg_salary
from employee_attrition
group by department
having avg(monthly_income) >
( 
select avg(monthly_income)
from employee_attrition)
order by avg_salary desc;



--Find Employees with the Maximum Years at Company
--Business Question
--Who has been with the company the longest?

select
   employee_number,
   department,
   years_at_company
from employee_attrition
where years_at_company =
(  select max(years_at_company)
   from employee_attrition)
  order by years_at_company desc;


--Find Employees Whose Salary is Below Their Department Average
--Business Question
--Which employees are earning less than the average salary in their own department?

SELECT
    employee_number,
    department,
    monthly_income
FROM employee_attrition e
WHERE monthly_income <
(
    SELECT AVG(monthly_income)
    FROM employee_attrition
    WHERE department = e.department   --correlated_subquery
)
ORDER BY department, monthly_income;