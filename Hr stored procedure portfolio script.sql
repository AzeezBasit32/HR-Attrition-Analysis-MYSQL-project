DELIMITER $$

CREATE PROCEDURE GetHRAnalytics(
    IN input_department VARCHAR(50),   -- Department filter (NULL for all)
    IN input_attrition VARCHAR(10)     -- Attrition filter ('Yes', 'No', or NULL for all)
)
BEGIN
    -- Selecting HR Metrics
    SELECT 
        COUNT(employee_id) AS total_employees,
        SUM(CASE WHEN attrition = 1 THEN 1 ELSE 0 END) AS total_attrition,
        (SUM(CASE WHEN attrition = 1 THEN 1 ELSE 0 END) / COUNT(employee_id)) * 100 AS attrition_rate,
        ROUND(AVG(monthly_income), 2) AS avg_monthly_income,
        MAX(monthly_income) AS max_income,
        MIN(monthly_income) AS min_income,
        department,
        job_role
    FROM ibm_hr
    WHERE 
        (input_department IS NULL OR department = input_department) 
        AND (input_attrition IS NULL OR attrition = input_attrition)
    GROUP BY department, job_role
    ORDER BY total_attrition DESC;
    
END $$

DELIMITER ;
