SELECT 
    STOCK_NAME,
    SUM(CASE 
            WHEN OPERATION = 'Buy' THEN -1 * PRICE
            ELSE PRICE END) AS CAPITAL_GAIN_LOSS
FROM STOCKS
GROUP BY STOCK_NAME