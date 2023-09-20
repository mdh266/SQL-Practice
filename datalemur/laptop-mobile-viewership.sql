SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type != 'laptop' THEN 1 ELSE 0 END) AS mobile_views
FROM 
  viewership