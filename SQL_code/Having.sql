--Find Departments Having More Than 200 Employees
--Business Question
--Which departments have the largest workforce?

select department,count(*) as total_count
from employee_attrition
group by department   
having count(*) > 200    --having filters groups after aggregation.
order by total_count desc;



--Find Job Roles with Average Salary Above $8,000
--Business Question
--Which job roles are highly paid?

select job_role,avg(monthly_income) as avg_salary
from employee_attrition
group by job_role  
having avg(monthly_income) > 8000    --having filters groups after aggregation.
order by avg_salary desc;

--Departments with Average Job Satisfaction Below 3
--Business Question
--Which departments may require employee engagement initiatives?
select department, avg(job_satisfaction) as avg_satisfaction
from employee_attrition
group by department
having avg(job_satisfaction) < 3
order by avg_satisfaction;
