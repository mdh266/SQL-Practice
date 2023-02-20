WITH product_by_year AS ( 
SELECT
  year, 
  product_id,
  curr_year_spend,
  LAG(curr_year_spend, 1) OVER (
        PARTITION BY product_id ORDER BY YEAR ASC) AS prev_year_spend
FROM (
  SELECT
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    SUM(spend) AS curr_year_spend
  FROM 
    user_transactions
  GROUP BY 
    product_id,
    year
  ) BASE
);

SELECT 
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  ROUND(100 * (curr_year_spend - prev_year_spend ) / prev_year_spend, 2) AS yoy_rate
FROM 
    product_by_year
;