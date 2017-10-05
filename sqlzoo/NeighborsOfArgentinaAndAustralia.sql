SELECT name, continent 
FROM world
WHERE continent LIKE
(SELECT continent FROM world WHERE name LIKE 'Argentina')
OR
continent LIKE
(SELECT continent FROM world WHERE name LIKE 'Australia')
ORDER BY name