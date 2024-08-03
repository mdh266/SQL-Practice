SELECT 
  transaction_date,
  user_id,
  SUM(transaction_count) OVER(
          PARTITION BY user_id
          ORDER BY transaction_date DESC
          ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS purchase_count
FROM  (
  SELECT 
    user_id,
    transaction_date,
    count(1) AS transaction_count,
    RANK() OVER(
            PARTITION BY user_id 
            ORDER BY transaction_date DESC
    ) AS transaction_rank
FROM
  user_transactions
GROUP BY 1,2
) T 
WHERE 
  T.transaction_rank = 1
ORDER BY 1 ASC
;