with cte as(
    select 
        'failed' as period_state,
        fail_date as date
    from failed
    where fail_date like '2019%'
    union all
    select
        'succeeded' as period_state,
        success_date as date
    from succeeded
    where success_date like '2019%'
    order by date
),
cte2 as(
    select
        *,
        row_number() over (order by date asc) as rn,
        dense_rank() over (partition by period_state order by date) as rnk,
        row_number() over (order by date asc) - dense_rank() over (partition by period_state order by date) as grp
    from cte)

select
    period_state,
    min(date) as start_date,
    max(date) as end_date
from cte2
group by period_state , grp 
order by date