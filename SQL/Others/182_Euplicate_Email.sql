SELECT EMAIL
FROM PERSON
GROUP BY EMAIL
HAVING COUNT(ID) > 1