
--CASE WHEN Queries

--Categorize Employees by Age
select employee_number , age,
case
when age < 30 then 'young'
when age BETWEEN 30 AND 45 then 'mid_age'
else 'old'
end as age_category
from employee_attrition;


--Categorize Salary Levels
select employee_number , monthly_income,
case
when monthly_income <5000 then 'low_salary'
when monthly_income BETWEEN 5000 AND 10000 then 'medium_salary'
else 'high_salary'
end as salary_category
from employee_attrition;


--Identify Employees at Attrition Risk
--Business Question

--Which employees might be at greater risk of leaving based on overtime?

select employee_number,overtime,
case
when overtime = 'Yes' then 'at risk'
else 'stable'
end as attrition_risk
from employee_attrition;


--Categorize Employees by Experience
--Business Question

--How experienced is our workforce?

select employee_number,total_working_years,
case
when total_working_years < 5 then 'less_experienced'
when total_working_years between 5  and 10 then 'mid_experience'
else 'highly_experienced'
end as experience_category
from employee_attrition;



--Find Employees Eligible for Promotion
--Business Question

--Which employees have gone the longest without a promotion?

SELECT
    employee_number,
    years_since_last_promotion,
    CASE
        WHEN years_since_last_promotion >= 5 THEN 'Promotion Recommended'
        ELSE 'Recently Promoted'
    END AS promotion_status
FROM employee_attrition
ORDER BY years_since_last_promotion DESC;

