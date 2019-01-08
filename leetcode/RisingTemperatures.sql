# https://leetcode.com/problems/rising-temperature

SELECT W1.Id
FROM Weather AS W1
LEFT JOIN Weather AS W2
ON DATE_ADD(W2.RecordDate, INTERVAL 1 DAY ) = W1.RecordDate
WHERE W1.Temperature > W2.Temperature
;
