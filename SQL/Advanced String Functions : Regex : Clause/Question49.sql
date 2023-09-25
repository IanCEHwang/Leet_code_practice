SELECT user_id , name , mail
FROM USERS
WHERE MAIL REGEXP '^[A-Za-z][A-Za-z0-9_\.-]*@leetcode\.com'