# https://leetcode.com/problems/department-top-three-salaries/submissions/

SELECT 
    Department,
    Employee,
    Salary
FROM (
    SELECT
        L.Name As Employee,
        L.Salary,
        R.Name AS Department,
        DENSE_RANK() OVER (
           PARTITION BY L.DepartmentId
           ORDER BY L.Salary DESC) rnk
    FROM 
        Employee AS L
    JOIN
        Department AS R
    ON 
        L.DepartmentId = R.Id
) base
WHERE 
        base.rnk <= 3
;