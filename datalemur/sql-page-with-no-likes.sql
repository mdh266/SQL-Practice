SELECT
  L.page_id
FROM 
  pages AS L 
LEFT JOIN 
  page_likes AS R 
ON
  L.page_id = R.page_id
WHERE 
  R.liked_date IS NULL
ORDER BY 
  page_id
;