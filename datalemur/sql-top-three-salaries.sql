SELECT
  D.department_name,
  E.name,
  E.salary
FROM (
  SELECT 
    name,
    salary,
    department_id,
    DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
  FROM 
    employee
  ) AS e
JOIN
  department AS D
ON
  E.department_id = D.department_id
WHERE
  salary_rank <= 3
ORDER BY 
  department_name ASC,
  salary DESC,
  name ASC
;

