
-- IN THIS PROJECT WE WILL FOCUS ON REAL BUSINESS PROBLEMS RATHER THAN JUST WRITING SQL QUERIES
-- we have only one data set here with all the information we needed 
--BASICS

--What employee data is available in our HR database?
--Business Insight:
--Returns every employee record and all available at
select * from employee_attrition;

--What are the basic demographic and salary details of employees?
--Business Insight:
--Useful for salary and workforce analysis.
select age, department , monthly_income
from employee_attrition;

--Which employees have resigned?
select * 
from employee_attrition
where attrition ='Yes';

--Which employees are above 40 years old?
select * 
from employee_attrition
where age > 40;

--Who works in the Sales department?
select * 
from employee_attrition
where department = 'Sales';

--Which employees are among the highest earners?
select employee_number,job_role,monthly_income
from employee_attrition
where monthly_income >10000;

--Display employees sorted by monthly salary (highest to lowest).
select employee_number,job_role,monthly_income
from employee_attrition
order by monthly_income desc;

--Which employees frequently travel for business?
select employee_number,job_role,business_travel
from employee_attrition
where business_travel ='Travel_Frequently';

--Which employees regularly work overtime?
select employee_number,job_role,overtime
from employee_attrition
where overtime = 'Yes';

--Which employees reported the lowest work-life balance?
select *
from employee_attrition
where work_life_balance =1;