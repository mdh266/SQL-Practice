SELECT
    L.user_id AS buyer_id,
    L.join_date,
    COALESCE(R.orders_in_2019, 0) orders_in_2019
FROM
    Users AS L
LEFT JOIN (
    SELECT 
         buyer_id,
         COUNT(1) AS orders_in_2019
    FROM
        Orders
    WHERE 
       YEAR(order_date) = 2019
    GROUP BY 1
) R
ON
    L.user_id = R.buyer_id
GROUP BY 1, 2
;