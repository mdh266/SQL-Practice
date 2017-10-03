/* https://leetcode.com/problems/customers-who-never-order/ */

SELECT Name 
FROM 
	(SELECT Name, CustomerId
	 FROM Customers
	 LEFT JOIN
	 Orders
	 ON (Customers.Id = Orders.CustomerId) 
	) Temp
WHERE Temp.CustomerId IS NULL
