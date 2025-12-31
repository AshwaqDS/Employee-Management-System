-- 2. JOB ROLE AND DEPARTMENT ANALYSIS 
-- ● How many different job roles exist in each department? 
SELECT 
    jobdept, COUNT(Job_ID) AS total_job_roles
FROM
    JobDepartment
GROUP BY jobdept;

-- ● What is the average salary range per department? 
SELECT 
    j.jobdept, AVG(s.amount) AS avg_salary
FROM
    JobDepartment j
        JOIN
    SalaryBonus s ON j.Job_ID = s.Job_ID
GROUP BY j.jobdept;

-- ● Which job roles offer the highest salary? 
SELECT 
    j.jobdept, j.name AS job_role, s.amount AS salary
FROM
    JobDepartment j
        JOIN
    SalaryBonus s ON j.Job_ID = s.Job_ID
ORDER BY s.amount DESC;


-- ● Which departments have the highest total salary allocation?

SELECT 
    j.jobdept, SUM(s.amount) AS total_salary_allocation
FROM
    JobDepartment j
        JOIN
    SalaryBonus s ON j.Job_ID = s.Job_ID
GROUP BY j.jobdept
ORDER BY total_salary_allocation DESC;
