SELECT USER_ID AS user_id , CONCAT(UPPER(LEFT(NAME , 1)) , LOWER(SUBSTRING(NAME , 2))) AS name
FROM USERS
ORDER BY USER_ID