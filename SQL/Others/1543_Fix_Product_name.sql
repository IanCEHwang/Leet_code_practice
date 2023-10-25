with cte as (
    select
        sale_id,
        trim(' ' from lower(product_name)) as product_name,
        substring(sale_date , 1 , 7) as sale_date
    from sales
)

select 
    product_name,
    sale_date,
    count(sale_id) as total
from cte
group by product_name , sale_date
order by product_name , sale_date