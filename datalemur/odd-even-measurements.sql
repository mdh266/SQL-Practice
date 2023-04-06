SELECT 
  measurement_day,
  SUM(CASE WHEN day_rnk % 2 != 0 THEN measurement_value ELSE 0 END) odd_sum,
  SUM(CASE WHEN day_rnk % 2 = 0 THEN measurement_value ELSE 0 END) even_sum
FROM (
  SELECT
    measurement_time::DATE AS measurement_day,
    measurement_value,
    ROW_NUMBER() OVER(
                    PARTITION BY measurement_time::DATE
                    ORDER BY measurement_time ASC
    ) AS day_rnk
  FROM 
    measurements
) BASE
GROUP BY 1
;