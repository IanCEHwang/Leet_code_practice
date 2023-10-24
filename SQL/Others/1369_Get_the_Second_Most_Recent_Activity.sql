with cte as(
    select
        username, 
        activity,
        startDate,
        endDate,
        dense_rank() over (partition by username order by startDate desc) as rk
    from useractivity)

select
    username,
    activity,
    startDate,
    endDate
from cte
where rk = 2
union all
select
    username,
    min(activity) as activity,
    min(startDate) as startDate,
    min(endDate) as endDate
from cte
group by username
having max(rk) = 1