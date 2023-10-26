select 
    warehouse_name,
    sum(volume) as volume
from(
    select
        name as warehouse_name,
        width * length * height * units as volume
    from products p
    left join warehouse w
    on p.product_id = w.product_id
    group by name , p.product_id) L
where volume is not null
group by warehouse_name