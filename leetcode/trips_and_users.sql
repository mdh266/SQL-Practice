-- https://leetcode.com/problems/trips-and-users/submissions/


# Write your MySQL query statement below
SELECT 
    L.request_at AS Day,
    ROUND(SUM(CASE WHEN L.status != 'completed' THEN 1 ELSE 0 END) /COUNT(1),2) AS 'Cancellation Rate'
FROM
    Trips AS L
JOIN 
( SELECT 
    users_id AS client_id
  FROM 
    Users
  WHERE
    banned = 'No'
  AND
    role IN ('client')
) R1
ON 
    L.client_id = R1.client_id
JOIN (
  SELECT
    users_id AS driver_id
  FROM 
    Users
  WHERE
    role IN ('driver')
  AND 
   banned = 'No'
) R2
ON 
    L.driver_id = R2.driver_id 
WHERE
    request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 1
;

