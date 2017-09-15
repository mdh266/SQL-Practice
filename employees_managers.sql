/* https://leetcode.com/problems/employees-earning-more-than-their-managers/description/ */
SELECT E1.name as Employee
FROM Employee E1 
LEFT JOIN Employee E2
ON (E1.ManagerId = E2.Id)
WHERE E1.Salary > E2.Salary;