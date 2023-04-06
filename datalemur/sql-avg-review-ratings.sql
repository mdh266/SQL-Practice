SELECT
  EXTRACT(MONTH FROM submit_date) AS mth,
  product_id AS product,
  ROUND(AVG(stars), 2) AS avg_stars
FROM
  reviews
GROUP BY 1, 2 
ORDER BY 1, 2
;