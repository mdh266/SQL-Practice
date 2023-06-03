SELECT 
  ROUND(SUM(sign_up) / COUNT(1), 2)
FROM (
SELECT 
  L.user_id,
  SUM(CASE WHEN R.signup_action = 'Confirmed' THEN 1 ELSE 0 END) AS sign_up
FROM 
  emails AS L 
LEFT JOIN
  texts AS R
ON 
  L.email_id = R.email_id
GROUP BY 1
) T 
;