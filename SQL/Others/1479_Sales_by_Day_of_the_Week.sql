SELECT
    item_category AS Category,
    SUM(CASE WHEN WEEKDAY(order_date)=0 THEN quantity ELSE 0 END) AS Monday,
    SUM(CASE WHEN WEEKDAY(order_date)=1 THEN quantity ELSE 0 END) AS Tuesday,
    SUM(CASE WHEN WEEKDAY(order_date)=2 THEN quantity ELSE 0 END) AS Wednesday,
    SUM(CASE WHEN WEEKDAY(order_date)=3 THEN quantity ELSE 0 END) AS Thursday,
    SUM(CASE WHEN WEEKDAY(order_date)=4 THEN quantity ELSE 0 END) AS Friday,
    SUM(CASE WHEN WEEKDAY(order_date)=5 THEN quantity ELSE 0 END) AS Saturday,
    SUM(CASE WHEN WEEKDAY(order_date)=6 THEN quantity ELSE 0 END) AS Sunday
FROM Items
LEFT JOIN Orders
USING(item_id)
GROUP BY item_category
ORDER BY Category