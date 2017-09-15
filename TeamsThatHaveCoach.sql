/* http://sqlzoo.net/wiki/The_JOIN_operation */

SELECT game.mdate, eteam.teamname
FROM
game 
JOIN
eteam
ON (game.team1 = eteam.id)
WHERE eteam.coach like 'Fernando Santos'
