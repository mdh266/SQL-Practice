
-- COMPLICATED

SELECT 
    id,
    num
FROM (
    SELECT
         COALESCE(L.id, R.id) as id,
         COALESCE(requester_cnt,0) + COALESCE(accepter_cnt,0) AS num,
         RANK() OVER( ORDER BY COALESCE(requester_cnt,0) + COALESCE(accepter_cnt,0) DESC) AS num_rank
    FROM(
        SELECT 
            requester_id AS id,
            COUNT(1) AS requester_cnt
        FROM 
            RequestAccepted
        GROUP BY 1
        ) L
        FULL OUTER JOIN
        ( SELECT 
            accepter_id AS id,
            COUNT(1) accepter_cnt
        FROM 
            RequestAccepted
        GROUP BY 1
    ) R
    ON 
        L.id = R.id
) BASE
WHERE num_rank = 1
;




-- SIMPLE

SELECT
     id,
     COUNT(1) as num
FROM
    (SELECT 
        requester_id AS id
    FROM
        RequestAccepted
    UNION ALL
    SELECT 
        accepter_id AS id
    FROM 
        RequestAccepted
) BASE
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1