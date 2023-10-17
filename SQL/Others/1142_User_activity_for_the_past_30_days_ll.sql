with cte as (
    select
        user_id , 
        count(distinct session_id) as type_cnt
    from activity
    where datediff('2019-07-27' , activity_date) between 0 and 29
    group by user_id)

select 
    case 
        when count(user_id) = 0 then 0
        else round(sum(type_cnt) / count(user_id) , 2) end as average_sessions_per_user
from cte
