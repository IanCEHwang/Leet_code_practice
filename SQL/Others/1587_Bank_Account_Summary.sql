SELECT 
    U.NAME ,    
    SUM(T.AMOUNT) AS BALANCE
FROM USERS U
LEFT JOIN TRANSACTIONS T ON T.ACCOUNT = U.ACCOUNT
GROUP BY U.ACCOUNT
HAVING BALANCE > 10000