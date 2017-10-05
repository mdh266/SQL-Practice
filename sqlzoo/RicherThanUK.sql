SELECT name 
FROM world
WHERE continent LIKE 'Europe'
AND gdp / population > 
(SELECT gdp / population 
 FROM world
 WHERE name LIKE 'United Kingdom')