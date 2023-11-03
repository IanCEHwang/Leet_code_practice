with cte as(
    select
        ceiling(minute / 6) as intervals,
        order_count  
    from orders
)

select
    intervals as interval_no,
    sum(order_count) as total_orders
from cte
group by intervals
order by intervals