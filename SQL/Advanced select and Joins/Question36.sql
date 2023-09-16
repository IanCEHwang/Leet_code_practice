SELECT "Low Salary" AS category , count(account_id) AS accounts_count
FROM ACCOUNTS
WHERE income < 20000
UNION ALL
SELECT "Average Salary" AS category , count(account_id) AS accounts_count
FROM ACCOUNTS
WHERE income >= 20000 AND income <= 50000
UNION ALL
SELECT "High Salary" AS category , count(account_id) AS accounts_count
FROM ACCOUNTS
WHERE income > 50000
