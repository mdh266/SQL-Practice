-- https://www.hackerrank.com/challenges/binary-search-tree-1/
SELECT
    N,
    CASE WHEN P IS NULL THEN 'Root'
         WHEN C = 'LEAF' THEN 'Leaf'
         ELSE 'Inner'
    END 
FROM (
    SELECT 
        T1.N, 
        T1.P,
        CASE WHEN T2.N IS NULL THEN 'LEAF' ELSE 'NOT LEAF' END AS C
    FROM 
        BST AS T1
    LEFT JOIN 
        BST AS T2
    ON
        T2.P = T1.N
    GROUP BY N,P,C
) BASE
GROUP BY 1,2
ORDER BY 1
;