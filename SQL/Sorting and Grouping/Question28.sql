SELECT CASE WHEN COUNT(*) is null THEN null ELSE T.TOP_NUM END AS num
FROM 
(SELECT NUM AS TOP_NUM
FROM MYNUMBERS
GROUP BY NUM
HAVING COUNT(NUM) = 1
ORDER BY TOP_NUM DESC
LIMIT 1) T