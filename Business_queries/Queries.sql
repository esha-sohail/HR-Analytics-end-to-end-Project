--Part 5: Real HR Analytics Business Queries 


-- Which Department Has the Highest Attrition Rate?

select 
department,
count(*) as total_employees,
count(*) FILTER(where attrition='Yes') as employee_left,
round(count(*) FILTER(where attrition='Yes') * 100 / count(*),2
) as attrition_rate
from employee_attrition
GROUP BY department
ORDER BY attrition_rate DESC;     -- sales dep have most attrition rate


--Does Overtime Increase Attrition?

select 
overtime,
count(*) as total_employees,
sum(case when attrition ='Yes' then 1 else 0 end) as employee_left,
round(sum(case when attrition ='Yes' then 1 else 0 end) * 100 / count(*),2) as attrition_rate
from employee_attrition
group by overtime;
--Business Insight
--Employees who work overtime have an attrition rate of 30%, compared to only 10% for employees
--who do not work overtime. This suggests that employees working overtime are three times more
--likely to leave the company.
--HR should investigate workload, staffing levels, and work-life balance to reduce employee turnover.



--Does Work-Life Balance Affect Attrition?
select 
work_life_balance,
count(*) as total_employees,
sum(case when attrition ='Yes' then 1 else 0 end) as employee_left,
round(sum(case when attrition ='Yes' then 1 else 0 end) * 100 / count(*),2) as attrition_rate
from employee_attrition
group by work_life_balance
order by work_life_balance
--business_insight
--yes poor work life balance havve higher attrition rate which is 31%




--Which Education Field Has the Highest Attrition?

select 
education_field,
count(*) as total_employees,
sum(case when attrition ='Yes' then 1 else 0 end) as employee_left,
round(sum(case when attrition ='Yes' then 1 else 0 end) * 100 / count(*),2) as attrition_rate
from employee_attrition
GROUP BY education_field
ORDER BY attrition_rate DESC; 

--insight
-- human resources have highest attrition rate



--Which Age Group Leaves the Most?

select 
case 
when age < 30 then 'young'
when age between 30 and 50 then 'mid_age'
else 'old'
end as age_group,
count(*) as total_employees,
sum(case when attrition ='Yes' then 1 else 0 end) as employee_left,
round(sum(case when attrition ='Yes' then 1 else 0 end)*100.0 /count(*),2) as attrition_rate
from employee_attrition
group by age_group
order by attrition_rate desc;
--insight
young ppl have highest attrition rate



--Which Job Role Has the Highest Average Salary?
select 
job_role,
round(avg(monthly_income),2) as avg_salary
from employee_attrition
group by job_role
order by avg_salary desc;
--insight
--managers have highest salary


--Which Department Has the Longest Average Employee Tenure
select 
department,
round(avg(years_at_company),2) as avg_salary
from employee_attrition
group by department
order by avg_salary desc;
--insight:sales Department Has the Longest Average Employee Tenure



--Which Employees Have Not Been Promoted for the Longest Time?
select 
employee_number,
job_role,
department,
years_since_last_promotion
from employee_attrition
order by years_since_last_promotion desc
limit 10;



--Does Salary Affect Attrition?

select attrition,
round(avg(monthly_income),2) as avg_salary
from employee_attrition
group by attrition;  
--insight: ppl with higher avg salary have less attrition



--Which Departments Have the Most Experienced Employees

select
department,
round(avg(total_working_years),2) as experience
from employee_attrition
group by department
order by experience desc;
--insight: human resource dep have highest experienced employees


--Which Job Roles Work the Most Overtime?
 select job_role,
 count(*) as total_employee,
 sum(case when overtime ='Yes' then 1 else 0 end) as employee_left,
 round(sum(case when overtime ='Yes' then 1 else 0 end)* 100.0/count(*),2) as 
 overtime_rate
 from employee_attrition
 group by job_role
 order by overtime_rate desc;
 --research scientist work the most overtime


