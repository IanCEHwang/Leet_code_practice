with cte as(
    select 
    T.customer_id,
    date_month,
    sum(price * quantity) as spent
    from (
        select
            *,
            month(order_date) as date_month
        from orders 
        where year(order_date) = '2020' and (month(order_date) = 6 or month(order_date) = 7)
    ) T
    left join product p
    on T.product_id = p.product_id
    group by date_month, customer_id
    having spent >= 100)

select 
    c.customer_id,
    name
from cte c
left join customers cu
on c.customer_id = cu.customer_id
group by name , c.customer_id
having count(spent) = 2