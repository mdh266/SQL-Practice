SELECT 
    id,
    CASE WHEN child_ct = 0 AND type = "Not Root" THEN "Leaf"
         WHEN child_ct > 0 AND type = "Not Root" THEN 'Inner'
         ELSE type
    END AS type
FROM (
SELECT 
    L.id,  
    CASE WHEN L.p_id IS NULL THEN 'Root' ELSE 'Not Root' END AS type,
    SUM(CASE WHEN R.id IS NULL THEN 0 ELSE 1 END) AS child_ct
From
    Tree AS L
LEFT JOIN
    Tree AS R
ON 
    L.id = R.p_id
GROUP BY 1,2
) Base
;