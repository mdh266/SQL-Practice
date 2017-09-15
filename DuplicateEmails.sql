/* https://leetcode.com/problems/duplicate-emails/description/ */

SELECT Email
FROM 
(SELECT Email, COUNT(Email) AS CNT
FROM Person
GROUP BY Email)
WHERE CNT > 1
