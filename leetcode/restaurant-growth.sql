# Write your MySQL query statement below
WITH daily_amounts AS (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM
        Customer
    GROUP BY 
        visited_on  
)


SELECT
    visited_on,
    amount,
    ROUND(amount/7, 2) AS average_amount
FROM (
SELECT
    visited_on,
    SUM(amount) OVER(
        ORDER BY visited_on 
        RANGE INTERVAL 6 DAY PRECEDING) AS amount
FROM
    daily_amounts
) base
WHERE
    DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM daily_amounts)) >= 6
