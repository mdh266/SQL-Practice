
-- Create cartesian and compare every transaction of same merchent, card, and amount to one another
-- and get the time between the transcations 
WITH crossjoin AS ( 
SELECT
  L.merchant_id,
  L.credit_card_id,
  L.amount,
  ABS(EXTRACT(MINS FROM L.transaction_timestamp - R.transaction_timestamp)) AS diff
FROM 
  transactions AS L
LEFT JOIN
  transactions AS R
ON (
  L.merchant_id = R.merchant_id
AND 
  L.credit_card_id = R.credit_card_id
AND
  L.amount = R.amount)
)

SELECT 
  COUNT(1) payment_count
FROM (
SELECT
  merchant_id,
  credit_card_id,
  amount,
  row_number() OVER(PARTITION BY merchant_id, credit_card_id, amount, diff ORDER BY diff ASC) AS TXN_NUM  
FROM 
  crossjoin
WHERE
  0 < diff -- Exclude comparing transaction to self
AND 
  diff < 10 -- within 10 minutes 
) BASE
WHERE 
  TXN_NUM != 1 -- exclude the first one since doesnt count as repeated transaction

