SELECT ACTOR_ID , DIRECTOR_ID
FROM ACTORDIRECTOR
GROUP BY ACTOR_ID , DIRECTOR_ID 
HAVING COUNT(TIMESTAMP) >= 3