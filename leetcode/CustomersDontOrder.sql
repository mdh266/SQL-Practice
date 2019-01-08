/* https://leetcode.com/problems/customers-who-never-order/ */

SELECT Name 
FROM 
	(SELECT Name, CustomerId
	 FROM Customers
	 LEFT JOIN
	 Orders
	 ON (Customers.Id = Orders.CustomerId) 
	) Temp
WHERE Temp.CustomerId IS NULL;


SELECT name As Customers
FROM Customers
WHERE Customers.Id NOT IN
(SELECT DISTINCT(CustomerId)
 FROM Orders)
;
