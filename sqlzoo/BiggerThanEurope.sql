SELECT w.name
FROM world w
JOIN (
    SELECT MAX(w2.gdp) AS max_gdp
    FROM world w2
    WHERE w2.continent = 'Europe'
) europe_max
ON w.gdp > europe_max.max_gdp;
