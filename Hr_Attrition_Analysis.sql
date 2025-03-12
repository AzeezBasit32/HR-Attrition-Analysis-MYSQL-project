-- ==========================================
--  📊 HR Data Analysis Script  
--  🏢 Dataset: IBM HR Employee Data  
--  🎯 Purpose: Gain insights into attrition, salary, job satisfaction, and more.
-- ==========================================

-- 1️⃣ EMPLOYEE ATTRITION OVERVIEW  
-- This query calculates the total number of employees and attrition percentage.

SELECT 
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM ibm_hr;

-- 🔍 Insight: Helps understand the percentage of employees leaving the company.

----------------------------------------------------------

-- 2️⃣ ATTRITION BY AGE GROUP  
-- Analyzes how attrition varies across different age groups.

SELECT 
    CASE 
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 35 THEN '25-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE 'Above 55'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM ibm_hr
GROUP BY age_group
ORDER BY age_group;

-- 🔍 Insight: Identifies which age group has the highest attrition.

----------------------------------------------------------

-- 3️⃣ SALARY DISTRIBUTION BY JOB ROLE  
-- Shows the average and median salary for each job role.

SELECT 
    job_role,
    COUNT(*) AS num_employees,
    ROUND(AVG(monthly_income), 2) AS avg_salary
FROM ibm_hr
GROUP BY job_role
ORDER BY avg_salary DESC;

-- 🔍 Insight: Helps compare salary differences between job roles.

----------------------------------------------------------

-- 4️⃣ DEPARTMENT-WISE ATTRITION ANALYSIS  
-- Identifies which departments experience the most attrition.

SELECT 
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM ibm_hr
GROUP BY department
ORDER BY attrition_rate DESC;

-- 🔍 Insight: Helps HR teams focus retention efforts on departments with high attrition.

----------------------------------------------------------

-- 5️⃣ IMPACT OF WORK-LIFE BALANCE ON ATTRITION  
-- Examines if employees with poor work-life balance leave more often.

SELECT 
    work_life_balance,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM ibm_hr
GROUP BY work_life_balance
ORDER BY attrition_rate DESC;

-- 🔍 Insight: Determines if poor work-life balance contributes to higher attrition.

----------------------------------------------------------

-- 6️⃣ RELATIONSHIP BETWEEN PERFORMANCE RATING AND SALARY HIKE  
-- Checks if employees with higher performance ratings get better salary hikes.

SELECT 
    performance_rating,
    ROUND(AVG(percent_salary_hike), 2) AS avg_salary_hike
FROM ibm_hr
GROUP BY performance_rating
ORDER BY performance_rating;

-- 🔍 Insight: Shows if performance ratings correlate with salary hikes.

----------------------------------------------------------

-- 7️⃣ IMPACT OF TRAINING ON EMPLOYEE RETENTION  
-- Analyzes whether employees who receive more training are less likely to leave.

SELECT 
    training_times_last_year,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM ibm_hr
GROUP BY training_times_last_year
ORDER BY training_times_last_year;

-- 🔍 Insight: Identifies if increasing training helps retain employees.

----------------------------------------------------------

-- 8️⃣ JOB SATISFACTION VS ATTRITION  
-- Examines if employees with low job satisfaction are more likely to leave.

SELECT 
    job_satisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM ibm_hr
GROUP BY job_satisfaction
ORDER BY attrition_rate DESC;

-- 🔍 Insight: Helps HR understand if improving job satisfaction reduces attrition.

----------------------------------------------------------

-- 9️⃣ GENDER-BASED ATTRITION ANALYSIS  
-- Compares attrition rates between male and female employees.

SELECT 
    gender,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM ibm_hr
GROUP BY gender;

-- 🔍 Insight: Identifies if gender plays a role in employee attrition.

-------------------------------------------------------
