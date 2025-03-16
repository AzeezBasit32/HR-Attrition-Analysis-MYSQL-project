-- Create the database
CREATE DATABASE IF NOT EXISTS ibm_hr_database;
USE ibm_hr_database;

-- Create the Employee table
CREATE TABLE IF NOT EXISTS ibm_hr (
	employee_id INT PRIMARY KEY,
	age TINYINT,
	attrition VARCHAR(3),
	business_travel VARCHAR(50),
	department VARCHAR(100),
	distance_from_home TINYINT, 
	education VARCHAR(100),
	education_field VARCHAR(100),
	environment_satisfaction VARCHAR(100),
	gender VARCHAR(100),
	job_involvement VARCHAR(50),
	job_role VARCHAR(100),
	job_satisfaction VARCHAR(100),
	marital_status VARCHAR(100),
	monthly_income DECIMAL(10,2),
	num_companies_worked TINYINT,
	over_time VARCHAR(100),
	percent_salary_hike TINYINT,
	performance_rating VARCHAR(100),
	relationship_satisfaction VARCHAR(100),
	training_times_last_year TINYINT,
	work_life_balance VARCHAR(100)
);

-- Load data from CSV (Modify the file path as needed)
LOAD DATA INFILE 'C:USERS\LENOVO\Downloads\ibm_hr'
INTO TABLE ibm_hr
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(employee_number, age, attrition, business_travel, department,
 distance_from_home, education, education_field, environment_satisfaction, 
 gender, job_involvement, job_role, job_satisfaction, marital_status, monthly_income,
 num_companies_worked, over_time, percent_salary_hike, performance_rating,
 relationship_satisfaction, training_times_last_year, work_life_balance
);

