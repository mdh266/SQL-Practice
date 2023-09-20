SELECT
    CAST(trans_date AS CHAR(7)) AS month,
    country,
    COUNT(1) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) approved_total_amount
FROM 
    Transactions
GROUP BY 1,2
;