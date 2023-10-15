with first_log_in as(
    select 
        player_id,
        min(event_date) as min_event_date
    from activity
    group by player_id
),
cte as(
    select 
        f.*,
        case 
            when a.event_date is null then 0
            else 1 end as log_back 
    from first_log_in f
    left join activity a 
        on f.player_id = a.player_id and
        f.min_event_date + 1 = a.event_date
)

select 
    min_event_date as install_dt,
    count(player_id) as installs,
    round(sum(log_back) / count(player_id) , 2) as Day1_retention 
from cte
group by min_event_date
order by install_dt