select
    seller_name
from seller
where seller_id not in (
    select 
        seller_id
    from orders
    where sale_date like '2020%'
)
order by seller_name