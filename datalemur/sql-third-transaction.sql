SELECT
  user_id,
  spend,
  transaction_date
FROM (
SELECT
  user_id,
  spend,
  transaction_date,
  ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS trans_rank
FROM 
  transactions
) base
WHERE
  base.trans_rank = 3
;