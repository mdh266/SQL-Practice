SELECT
  item_count 
FROM (
  SELECT
    item_count,
    DENSE_RANK() OVER(ORDER BY order_occurrences DESC) AS rnk 
  FROM 
    items_per_order
) BASE
WHERE rnk = 1
ORDER BY 1
;