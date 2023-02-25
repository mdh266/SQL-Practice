WITH cat_combos AS (
SELECT
  L.customer_id,
  R.product_category
FROM 
  customer_contracts AS L
LEFT JOIN
  products AS R
ON
  L.product_id = R.product_id
GROUP BY 1, 2
)


SELECT 
  customer_id
FROM (
  SELECT 
    customer_id,
    COUNT(1) AS category_ct
  FROM
    cat_combos
  GROUP BY 1
  HAVING COUNT(1)  = (SELECT COUNT(DISTINCT(product_category)) FROM products)
) base

