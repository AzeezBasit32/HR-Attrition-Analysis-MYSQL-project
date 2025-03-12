-- Drop views if they already exist to avoid conflicts
DROP VIEW IF EXISTS Attrition_Summary;
DROP VIEW IF EXISTS Attrition_By_Department;
DROP VIEW IF EXISTS Attrition_By_JobRole;
DROP VIEW IF EXISTS Attrition_By_JobSatisfaction;
DROP VIEW IF EXISTS Attrition_By_AgeGroup;
DROP VIEW IF EXISTS Attrition_By_Income;

-- 1. Employee Attrition Summary
CREATE VIEW Attrition_Summary AS
SELECT 
    COUNT(*) AS Total_Employees,
    SUM(Attrition) AS Employees_Left, 
    ROUND((SUM(Attrition) / COUNT(*)) * 100, 2) AS Attrition_Rate
FROM ibm_hr;

-- 2. Attrition by Department
CREATE VIEW Attrition_By_Department AS
SELECT 
    Department,
    COUNT(*) AS Total_Employees,
    SUM(Attrition) AS Employees_Left,
    ROUND((SUM(Attrition) / COUNT(*)) * 100, 2) AS Attrition_Rate
FROM ibm_hr
GROUP BY Department
ORDER BY Attrition_Rate DESC;

-- 3. Attrition by Job Role
CREATE VIEW Attrition_By_Job_Role AS
SELECT 
    Job_Role,
    COUNT(*) AS Total_Employees,
    SUM(Attrition) AS Employees_Left,
    ROUND((SUM(Attrition) / COUNT(*)) * 100, 2) AS Attrition_Rate
FROM ibm_hr
GROUP BY Job_Role
ORDER BY Attrition_Rate DESC;

-- 4. Attrition by Job Satisfaction
CREATE VIEW Attrition_By_Job_Satisfaction AS
SELECT 
    Job_Satisfaction,
    COUNT(*) AS Total_Employees,
    SUM(Attrition) AS Employees_Left,
    ROUND((SUM(Attrition) / COUNT(*)) * 100, 2) AS Attrition_Rate
FROM ibm_hr
GROUP BY Job_Satisfaction
ORDER BY Attrition_Rate DESC;

-- 5. Attrition by Age Group
CREATE VIEW Attrition_By_AgeGroup AS
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Above 50'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(Attrition) AS Employees_Left,
    ROUND((SUM(Attrition) / COUNT(*)) * 100, 2) AS Attrition_Rate
FROM ibm_hr
GROUP BY Age_Group
ORDER BY Attrition_Rate DESC;

-- 6. Attrition by Monthly Income Level
CREATE VIEW Attrition_By_Income AS
SELECT 
    CASE 
        WHEN Monthly_Income < 3000 THEN 'Low Income (<$3K)'
        WHEN Monthly_Income BETWEEN 3000 AND 7000 THEN 'Mid Income ($3K-$7K)'
        ELSE 'High Income (>$7K)'
    END AS Income_Level,
    COUNT(*) AS Total_Employees,
    SUM(Attrition) AS Employees_Left,
    ROUND((SUM(Attrition) / COUNT(*)) * 100, 2) AS Attrition_Rate
FROM ibm_hr
GROUP BY Income_Level
ORDER BY Attrition_Rate DESC;
