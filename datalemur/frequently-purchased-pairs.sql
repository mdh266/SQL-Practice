SELECT
  COUNT(DISTINCT(product_pairs))
FROM (
SELECT 
  transaction_id, 
  ARRAY_AGG(product_id) AS product_pairs
FROM 
  transactions
GROUP BY transaction_id
) BASE
WHERE
  ARRAY_LENGTH(product_pairs,1) > 1
;