WITH ranked_products AS (
SELECT 
  category,
  product,
  total_spend,
  RANK() OVER(PARTITION BY category ORDER BY total_spend DESC) AS rnk 
FROM (
SELECT 
  category,
  product,
  SUM(spend) AS total_spend
FROM 
  product_spend
WHERE
  EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY 1, 2
) BASE
)

SELECT 
  category,
  product,
  total_spend
FROM
  ranked_products
WHERE 
  rnk <= 2
ORDER BY 1 ASC,3 DESC
;