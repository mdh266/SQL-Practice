SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM (
    SELECT
        tiv_2016,
        COUNT(1) OVER(PARTITION BY tiv_2015) AS tiv_2015_ct,
        COUNT(1) OVER(PARTITION BY lat, lon) AS lat_lon_ct
    FROM
        Insurance
) T
WHERE 
    tiv_2015_ct > 1
AND
    lat_lon_ct = 1
;