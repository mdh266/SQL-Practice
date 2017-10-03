/* https://www.hackerrank.com/challenges/earnings-of-employees */

SELECT months*salary, COUNT(*) 
FROM Employee
WHERE months*salary >= 
(SELECT MAX(salary * months) 
FROM Employee)
