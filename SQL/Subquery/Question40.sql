WITH CTE AS(
  SELECT *
  FROM REQUESTACCEPTED
  UNION ALL
  SELECT ACCEPTER_ID , REQUESTER_ID , ACCEPT_DATE
  FROM REQUESTACCEPTED)

SELECT REQUESTER_ID AS id, COUNT(REQUESTER_ID) AS num
FROM CTE
GROUP BY REQUESTER_ID
ORDER BY num DESC
LIMIT 1
