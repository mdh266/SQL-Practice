SELECT yr,COUNT(title) 
FROM movie 
JOIN casting 
	ON movie.id=movieid
JOIN actor 
	ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=
(SELECT MAX(c) 
 FROM
	(SELECT yr,COUNT(title) AS c 
	 FROM movie 
	 JOIN casting 
	 ON movie.id=movieid
	 JOIN actor
	 ON actorid=actor.id
 WHERE name='John Travolta'
 GROUP BY yr) AS t
)