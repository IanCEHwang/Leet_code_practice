DELETE P
FROM PERSON P
LEFT JOIN 
(SELECT MIN(ID) AS MIN_ID , EMAIL
FROM PERSON
GROUP BY EMAIL) T ON P.EMAIL = T.EMAIL
WHERE P.ID > T.MIN_ID
