SELECT
  candidate_id
FROM  (
SELECT 
  candidate_id,
  ARRAY_AGG(skill) AS skills
FROM 
  candidates
GROUP BY 1
) A 
WHERE 
  'Python'=ANY(skills)
AND
  'Tableau'=ANY(skills)
AND
  'PostgreSQL'=ANY(skills)
;