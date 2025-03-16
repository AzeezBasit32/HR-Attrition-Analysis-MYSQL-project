# IBM HR Attrition Analysis - SQL Portfolio Project

## **Project Overview**
This project analyzes employee attrition using the IBM HR dataset. The objective is to uncover key factors influencing employee retention and attrition through SQL-based data exploration, cleaning, and analytical queries. The dataset consists of various attributes such as age, job role, years at company, salary, and work-life balance, which help in identifying patterns related to employee turnover.

## **Dataset Description**
The dataset comprises information on employees, including demographic details, job satisfaction, salary, work experience, and attrition status. The key columns include:
- **Employee_ID**: Unique identifier for each employee
- **Age**: Age of the employee
- **Department**: The department where the employee works
- **Job_Role**: Specific job position
- **YearsAtCompany**: Number of years the employee has spent at the company
- **Attrition**: Binary column (0 = No Attrition, 1 = Attrition)
- **MonthlyIncome**: Employee's salary per month
- **WorkLifeBalance**: Work-life balance rating (1-4)

The dataset was imported into MySQL, and various SQL scripts were executed to clean and analyze the data.

---

## **Project Structure**
The repository follows a structured format to ensure clarity and reproducibility:
```
│── README.md
│── datasets/
│   ├── raw_data.csv
│── database/
│   ├── data_import.sql
│── queries/
│   ├── data_cleaning.sql
│   ├── stored_procedures.sql
│   ├── views.sql
│── results/
│   ├── cleaned_data.csv
│── documentation/
│   ├── project_report.md
```

---

## **Step-by-Step Process**
### **1. Loading the Dataset**
The dataset was imported into MySQL using `data_import.sql`. The SQL script includes:
- Creation of the `employee_attrition` table
- Data type assignments
- Bulk insertion of CSV data

---

### **2. Data Cleaning & Preprocessing**
The `data_cleaning.sql` script was used to:
- Remove duplicate records
- Standardize categorical variables
- Convert the `Attrition` column to binary values (0 = No, 1 = Yes)
- Handle missing values
 
---

### **3. Data Analysis & Key Insights**
Several SQL queries were performed to analyze trends in attrition including
 1️⃣ EMPLOYEE ATTRITION OVERVIEW  
 2️⃣ ATTRITION BY AGE GROUP  
 3️⃣ SALARY DISTRIBUTION BY JOB ROLE 
 3️⃣ SALARY DISTRIBUTION BY JOB ROLE
 5️⃣ IMPACT OF WORK-LIFE BALANCE ON ATTRITION  
 6️⃣ RELATIONSHIP BETWEEN PERFORMANCE RATING AND SALARY HIKE
 7️⃣ IMPACT OF TRAINING ON EMPLOYEE RETENTION
 8️⃣ JOB SATISFACTION VS ATTRITION  
 9️⃣ GENDER-BASED ATTRITION ANALYSIS

---

### **4. Stored Procedures for Automation**
The `stored_procedures.sql` script includes automated data retrieval functions.

### **4. Views for repetition avoidance**
The Views.sql script contains queries for easy and automatic data retrieval. the script include codes t0 retrieve
    1. Employee Attrition Summary
    2. Attrition by Department
    3. Attrition by Job Role
    4. Attrition by Job Satisfaction
    5. Attrition by Age Group
    6. Attrition by Monthly Income Level
    
## **How to View the Results**
- The cleaned dataset is saved as `cleaned_data.csv` in the `results/` folder.
- The analysis queries and stored procedures can be executed in MySQL to generate insights.
- Predefined SQL views are saved in `views.sql`, which can be queried directly.

---

## **Objective of the Analysis**
The goal of this analysis was to:
1. Identify factors contributing to employee attrition.
2. Determine the most affected departments and job roles.
3. Provide a structured MySQL approach for HR analytics.
4. Automate key insights retrieval using stored procedures.

This project demonstrates the practical application of **SQL for HR analytics**, helping companies make data-driven decisions regarding employee retention.

---

## ** DISCLAIMER** 
The data used in the execution of this data is a synthetic data created by IBM data scientist. Hence, no business decisions or conclusions should be made based on its results 

---

