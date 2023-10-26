with cte as(
    select 
        count(distinct user_id) as user_cnt
    from users
)

select
    contest_id,
    round(count(user_id) / (select user_cnt from cte) * 100 , 2) as percentage
from register
group by contest_id
order by percentage desc, contest_id