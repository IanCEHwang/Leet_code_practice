with cte as(
    select 
        product_id,
        sum(unit) as sum_unit
    from orders
    where order_date like '2020-02-%'
    group by product_id)

select 
    product_name,
    sum_unit as unit
from cte c
left join products p
on c.product_id = p.product_id
where sum_unit >= 100