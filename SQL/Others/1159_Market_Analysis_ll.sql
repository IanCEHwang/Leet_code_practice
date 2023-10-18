with cte as(
    select
        L.*
    from (
        select
            seller_id,
            row_number() over (partition by seller_id order by order_date) as row_num,
            item_id
        from orders) L
    where row_num = 2
)
select
    user_id as seller_id,
    case 
        when i.item_brand = u.favorite_brand then 'yes'
        else 'no' end as 2nd_item_fav_brand
from users u
left join cte c 
on c.seller_id = u.user_id 
left join items i
on c.item_id = i.item_id
