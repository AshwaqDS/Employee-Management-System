-- 3. QUALIFICATION AND SKILLS ANALYSIS 
-- ● How many employees have at least one qualification listed? 
SELECT 
    COUNT(DISTINCT Emp_ID) AS employees_with_qualification
FROM
    Qualification;

-- ● Which positions require the most qualifications? 
SELECT 
    Position, COUNT(QualID) AS total_qualifications
FROM
    Qualification
GROUP BY Position
ORDER BY total_qualifications DESC;

-- ● Which employees have the highest number of qualifications? 
SELECT 
    e.firstname,
    e.lastname,
    COUNT(q.QualID) AS qualification_count
FROM
    Employee e
        JOIN
    Qualification q ON e.emp_ID = q.Emp_ID
GROUP BY e.emp_ID , e.firstname , e.lastname
ORDER BY qualification_count DESC;
