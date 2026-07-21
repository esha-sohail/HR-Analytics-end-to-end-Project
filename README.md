# HR Analytics SQL Project – Analysis Report

## Executive Summary

This project analyzes an employee attrition dataset using PostgreSQL to uncover meaningful workforce insights through SQL. The analysis covers employee demographics, compensation, performance, satisfaction, overtime, promotions, experience, and attrition. By applying SQL concepts ranging from basic aggregation to advanced window functions and Common Table Expressions (CTEs), the project transforms raw HR data into actionable business intelligence that can support organizational decision-making.

## Key Findings

### 1. Employee Distribution

The dataset was analyzed to understand the distribution of employees across departments, job roles, education fields, marital status, and business travel categories. This provides HR with an overview of the organization's workforce composition and helps identify departments with larger staffing requirements.

### 2. Attrition Analysis

Employee attrition was examined across multiple dimensions, including departments, overtime, education fields, age groups, and job roles. The analysis revealed that attrition is not evenly distributed across the organization, indicating that certain employee groups face higher turnover risks than others.

### 3. Impact of Overtime

One of the strongest findings from the analysis is the relationship between overtime and employee attrition. Employees working overtime experienced an attrition rate of approximately **30%**, while employees not working overtime showed an attrition rate of approximately **10%**. This suggests that employees who regularly work overtime are significantly more likely to leave the organization, highlighting workload management as a key retention concern.

### 4. Salary Analysis

Salary trends were explored using averages, rankings, quartiles, and departmental comparisons. Departments and job roles with the highest average salaries were identified, while employees were grouped into salary quartiles to understand income distribution. Departmental average salaries were also compared with the overall company average to identify compensation differences across departments.

### 5. Department-Level Performance

Each department was evaluated based on workforce size, average salary, average age, job satisfaction, work-life balance, performance rating, and average tenure. These summaries provide HR managers with a comprehensive overview of departmental performance and employee well-being.

### 6. Employee Rankings

Window functions such as `ROW_NUMBER()`, `RANK()`, and `DENSE_RANK()` were used to rank employees by salary within departments and across the organization. This analysis identified the highest-paid employees and supported comparisons among departments and job roles.

### 7. Salary Distribution

Using the `NTILE()` function, employees were divided into salary quartiles. This helped identify the highest-paid and lowest-paid segments of the workforce, supporting compensation benchmarking and salary structure analysis.

### 8. Salary Progression

Window functions including `LAG()` and `LEAD()` were applied to compare employee salaries with previous and next salary values. These comparisons provide insight into salary progression and differences between consecutive employees.

### 9. Experience and Promotion Analysis

The project identified departments with the highest average employee experience and highlighted employees who had not received promotions for extended periods. These findings can help HR identify potential promotion candidates and evaluate career progression policies.

### 10. Job Satisfaction and Work-Life Balance

Average job satisfaction and work-life balance scores were analyzed across departments. These metrics help assess employee engagement and identify departments where workplace improvements may be needed.

### 11. High-Risk Employee Identification

Employees meeting multiple risk factors—including overtime, low job satisfaction, poor work-life balance, and long periods without promotion—were identified as potential attrition risks. This enables HR teams to take proactive retention measures before valuable employees leave the organization.

### 12. Top Talent Identification

The project identified the top 10% highest-paid employees using window functions. Such analyses can support succession planning, leadership development, and retention strategies for high-value employees.

## SQL Skills Demonstrated

This project demonstrates proficiency in:

* Data filtering and sorting
* Aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`)
* `GROUP BY` and `HAVING`
* Conditional logic using `CASE`
* Joins and subqueries
* Common Table Expressions (CTEs)
* Window functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`, `LEAD`, `FIRST_VALUE`, `LAST_VALUE`, `NTILE`)
* Ranking and analytical reporting
* Business-oriented SQL problem solving

## Business Recommendations

Based on the analysis, the following recommendations are proposed:

* Monitor employees who frequently work overtime, as they exhibit substantially higher attrition rates.
* Review compensation structures for departments whose average salaries fall below the company average.
* Regularly evaluate employees with long periods since their last promotion to improve career development opportunities.
* Focus retention initiatives on departments and employee groups with higher attrition rates.
* Improve work-life balance and employee satisfaction through targeted HR policies and wellness initiatives.
* Use salary quartiles and ranking analyses to ensure fair compensation and identify high-performing employees for rewards and recognition.

## Conclusion

This project demonstrates how SQL can be used not only to retrieve data but also to generate meaningful business insights. Through exploratory analysis, aggregation, window functions, and advanced SQL techniques, the project provides actionable recommendations for workforce planning, employee retention, compensation analysis, and organizational performance. It highlights the practical application of SQL in solving real-world HR analytics problems and reflects the analytical skills expected of a Data Analyst.
