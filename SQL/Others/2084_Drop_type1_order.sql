select
    order_id,
    customer_id,
    order_type
from orders
where customer_id not in (
    select
        distinct customer_id
    from orders
    where order_type = 0
)
union all

select
    order_id,
    customer_id,
    order_type
from orders
where customer_id in (
    select
        distinct customer_id
    from orders
    where order_type = 0
) and order_type <> 1