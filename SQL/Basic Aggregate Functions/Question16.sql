SELECT U.PRODUCT_ID , ROUND(SUM(U.UNITS * P.PRICE) / SUM(U.UNITS) , 2) AS average_price
FROM UNITSSOLD U
LEFT JOIN PRICES P ON U.PURCHASE_DATE BETWEEN P.START_DATE AND P.END_DATE AND U.PRODUCT_ID = P.PRODUCT_ID
GROUP BY U.PRODUCT_ID