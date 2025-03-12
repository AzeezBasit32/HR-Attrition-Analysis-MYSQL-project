-- Ensure columns have the correct data types.

SET SQL_SAFE_UPDATES = 0;

-- Fill or remove NULLs based on logical assumptions.
-- Replace NULLs in categorical columns with 'Unknown'

UPDATE ibm_hr
SET business_travel = COALESCE(business_travel, 'Unknown'),
    department = COALESCE(department, 'Unknown'),
    education_field = COALESCE(education_field, 'Unknown'),
    gender = COALESCE(gender, 'Unknown'),
    job_role = COALESCE(job_role, 'Unknown'),
    marital_status = COALESCE(marital_status, 'Unknown');

-- Replace NULLs in numerical columns with appropriate values (e.g., median or 0)
UPDATE ibm_hr
SET environment_satisfaction = COALESCE(environment_satisfaction, (SELECT ROUND(AVG(environment_satisfaction), 0) FROM ibm_hr)),
    job_involvement = COALESCE(job_involvement, (SELECT ROUND(AVG(job_involvement), 0) FROM ibm_hr)),
    job_satisfaction = COALESCE(job_satisfaction, (SELECT ROUND(AVG(job_satisfaction), 0) FROM ibm_hr)),
    relationship_satisfaction = COALESCE(relationship_satisfaction, (SELECT ROUND(AVG(relationship_satisfaction), 0) FROM ibm_hr)),
    work_life_balance = COALESCE(work_life_balance, (SELECT ROUND(AVG(work_life_balance), 0) FROM ibm_hr));


-- Ensure no duplicate employee records.
DELETE FROM ibm_hr
WHERE employee_id IN (
    SELECT employee_id FROM (
        SELECT employee_id, ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY employee_id) AS row_num
        FROM ibm_hr
    ) AS duplicates
    WHERE row_num > 1
);

-- ENSURING CONSISENT DATA FORMATTING
UPDATE ibm_hr
SET gender = CASE 
    WHEN gender IN ('M', 'Male') THEN 'Male'
    WHEN gender IN ('F', 'Female') THEN 'Female'
    ELSE 'Unknown'
END;

UPDATE ibm_hr
SET business_travel = CASE 
    WHEN business_travel LIKE '%Rarely%' THEN 'Travel_Rarely'
    WHEN business_travel LIKE '%Frequently%' THEN 'Travel_Frequently'
    ELSE 'Non-Travel'
END;

UPDATE ibm_hr
SET attrition = CASE 
    WHEN attrition = 'Yes' THEN '1'
    WHEN attrition = 'No' THEN '0'
    ELSE 'Unknown'
END;

-- CHECKING FOR UNREALISTIC VALUES
-- Find employees with impossible age values (e.g., below 18 or above 70)
SELECT * FROM ibm_hr WHERE age < 18 OR age > 70;

-- Find employees with negative income
SELECT * FROM ibm_hr WHERE monthly_income < 0;

-- Find employees with unrealistic salary hikes (e.g., above 50%)
SELECT * FROM ibm_hr WHERE percent_salary_hike > 50;


SET SQL_SAFE_UPDATES = 1;
