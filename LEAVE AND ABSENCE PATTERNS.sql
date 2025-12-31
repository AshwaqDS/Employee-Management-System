-- 4. LEAVE AND ABSENCE PATTERNS 
-- ● Which year had the most employees taking leaves? 
SELECT 
    YEAR(date) AS year, COUNT(*) AS total_leaves
FROM
    Leaves
GROUP BY YEAR(date)
ORDER BY total_leaves DESC;

-- ● What is the average number of leave days taken by its employees per department? 
SELECT 
    j.jobdept, AVG(leaves_count) AS avg_leaves_per_employee
FROM
    (SELECT 
        emp_ID, COUNT(*) AS leaves_count
    FROM
        Leaves
    GROUP BY emp_ID) l
        JOIN
    Employee e ON l.emp_ID = e.emp_ID
        JOIN
    JobDepartment j ON e.Job_ID = j.Job_ID
GROUP BY j.jobdept;

-- ● Which employees have taken the most leaves? 
SELECT 
    e.firstname, e.lastname, COUNT(l.leave_ID) AS total_leaves
FROM
    Leaves l
        JOIN
    Employee e ON l.emp_ID = e.emp_ID
GROUP BY e.emp_ID , e.firstname , e.lastname
ORDER BY total_leaves DESC;

-- ● What is the total number of leave days taken company-wide? 
SELECT 
    COUNT(*) AS total_leave_days
FROM
    Leaves;

-- ● How do leave days correlate with payroll amounts?
SELECT 
    e.firstname,
    e.lastname,
    COUNT(l.leave_ID) AS total_leaves,
    SUM(p.total_amount) AS total_payroll
FROM
    Employee e
        LEFT JOIN
    Leaves l ON e.emp_ID = l.emp_ID
        LEFT JOIN
    Payroll p ON e.emp_ID = p.emp_ID
GROUP BY e.emp_ID , e.firstname , e.lastname;
