SELECT USER_ID,
        MAX(TIME_STAMP) AS last_stamp
FROM LOGINS
WHERE TIME_STAMP LIKE '2020%'
GROUP BY USER_ID