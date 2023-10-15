select distinct buyer_id 
from sales
where buyer_id in (
    select buyer_id
    from sales
    where product_id = (select product_id from product where product_name = 'S8')
) and buyer_id not in (
    select buyer_id
    from sales
    where product_id = (select product_id from product where product_name = 'iPhone'))