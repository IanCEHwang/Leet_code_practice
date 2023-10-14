with cte as(
    select 
        seller_id,
        sum(price) as sum_p
    from sales
    group by seller_id
)

select distinct seller_id
from sales
where seller_id in (
    select seller_id
    from cte
    where sum_p = (select max(sum_p) from cte)
)