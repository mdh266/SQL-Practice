CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT 
        Salary
      FROM (
      SELECT 
        Salary,
        DENSE_RANK() OVER(ORDER BY Salary DESC) AS rnk
      FROM Employee
      ) base
      WHERE rnk = N
      GROUP BY 1
  );
END