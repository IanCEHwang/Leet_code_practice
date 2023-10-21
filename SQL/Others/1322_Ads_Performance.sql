with cte as(
    select
        ad_id,
        case 
            when action = 'Clicked' then 1
            else 0 end as action_type 
    from ads
    where action <> 'Ignored'
)

select
    distinct a.ad_id,
    case 
        when round(sum(action_type) / count(action_type) * 100 , 2) is null then 0
        else round(sum(action_type) / count(action_type) * 100 , 2) end as ctr
from ads a
left join cte c on a.ad_id = c.ad_id
group by ad_id
order by ctr desc , ad_id 