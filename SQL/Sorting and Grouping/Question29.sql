WITH CTE AS(
  SELECT DISTINCT CUSTOMER_ID , PRODUCT_KEY
  FROM CUSTOMER
)

SELECT CTE.CUSTOMER_ID AS CUSTOMER_ID FROM CTE
WHERE CTE.PRODUCT_KEY IN (SELECT PRODUCT_KEY FROM PRODUCT)
GROUP BY CTE.CUSTOMER_ID
HAVING COUNT(CTE.PRODUCT_KEY) = (SELECT COUNT(*) FROM PRODUCT)