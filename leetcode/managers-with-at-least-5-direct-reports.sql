SELECT 
    name
FROM (
    SELECT
        L.id,
        L.name
    FROM
        Employee AS L
    LEFT JOIN 
        Employee AS R
    ON 
        L.id = R.managerId
    GROUP BY 1,2
    HAVING 
        COUNT(1) >= 5
) base
;