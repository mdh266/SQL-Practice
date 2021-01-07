# https://leetcode.com/problems/human-traffic-of-stadium/
# Write your MySQL query statement below
SELECT 
    id,
    visit_date,
    people
FROM (
    SELECT 
        id,
        LAG(id,1) OVER(ORDER BY id ASC) AS lag_id,
        LAG(id,2) OVER(ORDER BY id ASC) AS lag2_id,
        LEAD(id,1) OVER(ORDER BY id ASC) AS lead_id,
        LEAD(id,2) OVER(ORDER BY id ASC) AS lead2_id,
        visit_date,
        people
    FROM 
        Stadium
    WHERE
        people >= 100
) A
WHERE (
    ((id = lead_id - 1) AND (id = lead2_id - 2))
OR
    ((id = lag_id + 1) AND (id = lag2_id + 2))
OR 
    ((id = lag_id + 1)  AND (id = lead_id - 1))
)
ORDER BY 
    visit_date
