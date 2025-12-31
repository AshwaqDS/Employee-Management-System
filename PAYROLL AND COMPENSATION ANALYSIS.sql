-- 5. PAYROLL AND COMPENSATION ANALYSIS 
-- ● What is the total monthly payroll processed? 
SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(total_amount) AS total_monthly_payroll
FROM
    Payroll
GROUP BY YEAR(date) , MONTH(date)
ORDER BY year , month;

-- ● What is the average bonus given per department? 
SELECT 
    j.jobdept, AVG(s.bonus) AS avg_bonus
FROM
    JobDepartment j
        JOIN
    SalaryBonus s ON j.Job_ID = s.Job_ID
GROUP BY j.jobdept;

-- ● Which department receives the highest total bonuses? 
SELECT 
    j.jobdept, SUM(s.bonus) AS total_bonus
FROM
    JobDepartment j
        JOIN
    SalaryBonus s ON j.Job_ID = s.Job_ID
GROUP BY j.jobdept
ORDER BY total_bonus DESC;

-- ● What is the average value of total_amount after considering leave deductions? 
SELECT 
    AVG(total_amount) AS avg_final_pay
FROM
    Payroll;
    
-- Department-wise Overall Summary    
SELECT 
    j.jobdept AS Department,
    COUNT(DISTINCT e.emp_ID) AS Total_Employees,
    SUM(p.total_amount) AS Total_Salary_Paid,
    AVG(p.total_amount) AS Avg_Salary,
    COUNT(l.leave_ID) AS Total_Leaves_Taken
FROM JobDepartment j
LEFT JOIN Employee e ON j.Job_ID = e.Job_ID
LEFT JOIN Payroll p ON e.emp_ID = p.emp_ID
LEFT JOIN Leaves l ON e.emp_ID = l.emp_ID
GROUP BY j.jobdept
ORDER BY Total_Salary_Paid DESC;

