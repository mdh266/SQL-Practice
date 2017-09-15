/* https://leetcode.com/problems/second-highest-salary/description/ */

SELECT MAX(Salary) AS SecondHighestSalary
FROM 
Employee E2
WHERE
E2.Salary <
(SELECT MAX(Salary)
FROM 
Employee)