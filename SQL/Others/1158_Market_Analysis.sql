WITH CTE AS(
  SELECT *
  FROM ORDERS
  WHERE ORDER_DATE BETWEEN '2019-01-01' AND '2019-12-31'
)

SELECT U.USER_ID AS buyer_id , U.JOIN_DATE , COUNT(O.ORDER_ID) AS orders_in_2019
FROM USERS U
LEFT JOIN CTE O ON U.USER_ID = O.BUYER_ID
GROUP BY U.USER_ID
