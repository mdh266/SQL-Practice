SELECT
  ROUND(
    100 * SUM(CASE WHEN base.caller_country_id != R.country_id 
             THEN 1 
             ELSE 0 END)::NUMERIC / COUNT(*)::NUMERIC, 1)
    AS international_calls_pct
FROM (
  SELECT 
    L.caller_id,
    R.country_id AS caller_country_id,
    L.receiver_id
  FROM 
    phone_calls AS L
  LEFT JOIN
    phone_info AS R
  ON 
    L.caller_id = R.caller_id
) AS base
LEFT JOIN
  phone_info AS R
ON 
  base.receiver_id = R.caller_id
