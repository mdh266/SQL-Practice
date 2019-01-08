/* https://leetcode.com/problems/duplicate-emails/description/ */

SELECT Email
FROM 
(SELECT Email, COUNT(Email) AS CNT
FROM Person
GROUP BY Email)
WHERE CNT > 1


SELECT Email, COUNT(1) AS ct
FROM Person
GROUP BY 1
HAVING ct > 1
