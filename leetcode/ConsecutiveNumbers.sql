SELECT 
    Num AS ConsecutiveNums
FROM (
    SELECT 
        Num,
        LAG(Num, 1) OVER(ORDER BY Id ASC) lag1,
        LAG(Num, 2) OVER(ORDER BY Id ASC) lag2
    FROM 
        logs
) LAGS
WHERE  
    Num - lag1 = 0
AND
    Num - lag2 = 0
GROUP BY 1
;