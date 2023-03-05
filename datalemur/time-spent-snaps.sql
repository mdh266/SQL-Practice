SELECT
  R.age_bucket,
  ROUND(100 * SUM(CASE WHEN L.activity_type = 'send' 
                       THEN L.time_spent 
                       ELSE 0 END) / SUM(time_spent), 2) AS send_perc,
  ROUND(100 * SUM(CASE WHEN L.activity_type = 'open' 
                      THEN L.time_spent 
                      ELSE 0 END) / SUM(time_spent), 2) AS open_prec
FROM 
  activities AS L   
JOIN 
  age_breakdown AS R   
ON
  L.user_id = R.user_id
WHERE
  L.activity_type IN ('open', 'send')
GROUP BY 1
;