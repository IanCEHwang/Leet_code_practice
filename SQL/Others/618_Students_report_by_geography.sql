with cte as(
    select 
        *,
        row_number() over (partition by continent order by name) as cont
    from 
    student),

cte2 as (
    select cont,
    case 
        when continent = 'America' then name
        else NULL end as 'America',
    case 
        when continent = 'Asia' then name
        else NULL end as 'Asia',
    case 
        when continent = 'Europe' then name
        else NULL end as 'Europe'    
    from cte
)

select
    max(America) as America, max(Asia) as Asia, max(Europe) as Europe
from cte2
group by cont