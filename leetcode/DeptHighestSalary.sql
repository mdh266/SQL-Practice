SELECT 
    D.Name AS Department,
    E.Name As Employee,
    E.Salary
FROM (
    SELECT 
        Name,
        DepartmentId,
        Salary,
        RANK() OVER(PARTITION BY DepartmentId ORDER BY Salary DESC) rnk
    FROM
        Employee 
) AS E
JOIN Department As D
ON 
    E.DepartmentId = D.Id
WHERE 
    E.rnk = 1
;