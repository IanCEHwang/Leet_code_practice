with cte as(
    select
        distinct spend_date,
        'mobile' as 'platform'
        from spending
    union all
    select
        distinct spend_date,
        'desktop' as 'platform'
        from spending
    union all
    select
        distinct spend_date,
        'both' as 'platform'
        from spending),
cte2 as(
    select 
        user_id,
        spend_date,
        case 
            when count(distinct platform) = 2 then 'both'
            else platform end as platform_type,
        sum(amount) as ttl_spend
    from spending 
    group by user_id , spend_date

),
cte3 as(
    select 
        spend_date,
        platform_type as platform,
        sum(ttl_spend) as total_amount,
        count(user_id) as total_users
    from cte2
    group by spend_date , platform_type
)
select
    c1.spend_date,
    c1.platform,
    case 
        when total_amount is null then 0
        else total_amount end as total_amount,
    case 
        when total_users is null then 0
        else total_users end as total_users
from cte c1
left join cte3 c3 on c3.spend_date = c1.spend_date and c1.platform = c3.platform