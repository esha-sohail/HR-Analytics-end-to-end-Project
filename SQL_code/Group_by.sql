--What is the gender distribution of employees?
select gender,count(*) as gender_count
from employee_attrition
group by gender
order by gender_count;

--How many employees are Single, Married, or Divorced?
select marital_status,count(*) as total_count
from employee_attrition
group by marital_status
order by total_count;

--Which educational backgrounds are most common?
select education_field,count(*) as total_count
from employee_attrition
group by education_field
order by total_count desc;

--Find Departments with the Highest Attrition
--Business Question
--Which departments lose the most employee

select department,count(*) as total_count
from employee_attrition
where attrition='Yes'
group by department
order by total_count desc;

--Average Age by Department
--Business Question

--Which departments have older or younger employees?
select department, avg(age) as avg_age
from employee_attrition
group by department
order by avg_age desc;

--Average Years at Company by Department
--Business Question
--Which departments have employees who stay the longest?

select department, avg(years_at_company) as avg_stay
from employee_attrition
group by department
order by avg_stay desc;

--Average Work-Life Balance by Department
--Business Question
--Which department has the best work-life balance?
select department, avg(work_life_balance) as avg_work_life
from employee_attrition
group by department
order by avg_work_life desc;

