SELECT ROUND(SUM(TIV_2016) , 2) AS tiv_2016
FROM(
    SELECT 
    *,
    COUNT(*) OVER (PARTITION BY TIV_2015) AS TIV_2015_CNT,
    COUNT(*) OVER (PARTITION BY LAT , LON) AS LOC_CNT
    FROM INSURANCE    
) T
WHERE TIV_2015_CNT > 1 AND LOC_CNT = 1