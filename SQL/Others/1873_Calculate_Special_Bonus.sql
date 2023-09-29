SELECT
    EMPLOYEE_ID,
    CASE
        WHEN NAME REGEXP '^M.*' THEN 0
        WHEN EMPLOYEE_ID % 2 = 0 THEN 0
        ELSE SALARY END AS bonus
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID