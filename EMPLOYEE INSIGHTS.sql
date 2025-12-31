-- Analysis Questions 
-- 1. EMPLOYEE INSIGHTS 
-- ● How many unique employees are currently in the system? 
SELECT 
    COUNT(*) AS total_employees
FROM
    Employee;

-- ● Which departments have the highest number of employees? 
SELECT 
    j.jobdept, COUNT(e.emp_ID) AS employee_count
FROM
    Employee e
        JOIN
    JobDepartment j ON e.Job_ID = j.Job_ID
GROUP BY j.jobdept
ORDER BY employee_count DESC;


-- ● What is the average salary per department? 

SELECT 
    j.jobdept, AVG(s.amount) AS avg_salary
FROM
    Employee e
        JOIN
    JobDepartment j ON e.Job_ID = j.Job_ID
        JOIN
    SalaryBonus s ON j.Job_ID = s.Job_ID
GROUP BY j.jobdept;

-- ● Who are the top 5 highest-paid employees? 
SELECT 
    e.firstname, e.lastname, s.amount AS salary
FROM
    Employee e
        JOIN
    SalaryBonus s ON e.Job_ID = s.Job_ID
ORDER BY s.amount DESC
LIMIT 5;

-- ● What is the total salary expenditure across the company?
SELECT 
    SUM(s.amount) AS total_salary_expenditure
FROM
    Employee e
        JOIN
    SalaryBonus s ON e.Job_ID = s.Job_ID;
