with a as (
    select num,
            frequency,
           sum(frequency) over (order by num) - frequency as lower_num,
           sum(frequency) over (order by num) as upper_num,
           sum(frequency) over () / 2 as medium_num
    from numbers 
)

select avg(num) as median
from a
where medium_num between lower_num and upper_num