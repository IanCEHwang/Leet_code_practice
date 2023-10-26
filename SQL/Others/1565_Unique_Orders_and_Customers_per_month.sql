with cte as (
    select 
        order_id,
        customer_id,
        invoice,
        substring(order_date , 1 , 7) as month
    from orders
    where invoice > 20
)

select
    month,
    count(order_id) as order_count,
    count(distinct customer_id) as customer_count
from cte
group by month
order by month