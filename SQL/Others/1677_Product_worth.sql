select 
    name,
    coalesce(sum(rest) , 0) as rest,
    coalesce(sum(paid) , 0) as paid,
    coalesce(sum(canceled) , 0) as canceled,
    coalesce(sum(refunded) , 0) as refunded
from product p
left join invoice i
on p.product_id = i.product_id
group by name
order by name