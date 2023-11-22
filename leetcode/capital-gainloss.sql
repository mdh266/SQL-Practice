SELECT
    stock_name,
    total_sell - total_buy AS capital_gain_loss
FROM (
SELECT
    stock_name,
    SUM(CASE WHEN operation = 'Buy' THEN price ELSE 0 END) AS total_buy,
    SUM(CASE WHEN operation = 'Sell' THEN price ELSE 0 END) AS total_sell
FROM
    Stocks
GROUP BY 1
) T
;

-- or

SELECT
    stock_name,
    SUM(CASE WHEN operation = 'Buy' THEN -price
             ELSE price 
        END) AS capital_gain_loss
FROM
    Stocks
GROUP BY 1
;
