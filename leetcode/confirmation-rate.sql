# Write your MySQL query statement below
SELECT
    L.user_id,
    ROUND(
        CAST(
            COALESCE( SUM(CASE WHEN R.action = 'confirmed' THEN 1 ELSE 0 END), 0)
        AS DOUBLE) / COUNT(1) 
        , 2) AS confirmation_rate
FROM
    Signups AS L
LEFT JOIN
    Confirmations AS R
ON 
    L.user_id = R.user_id
GROUP BY 1
;