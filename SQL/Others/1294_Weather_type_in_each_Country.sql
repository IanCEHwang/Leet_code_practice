with cte as(
    select
        c.country_id,
        avg(weather_state) as avg_w
    from countries c
    left join weather w
    on c.country_id = w.country_id
    where day like '2019-11%'
    group by c.country_id , c.country_name)

select 
    country_name,
    case 
        when avg_w >= 25 then 'Hot'
        when avg_w <= 15 then 'Cold'
        else 'Warm' end as weather_type
from countries co
left join cte c 
on co.country_id = c.country_id
where avg_w is not null