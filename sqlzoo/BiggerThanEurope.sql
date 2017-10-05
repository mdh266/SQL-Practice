SELECT name 
FROM world
WHERE gdp > 
	  (SELECT 
	   MAX(gdp) 
	   FROM world 
	   WHERE continent LIKE 'Europe')