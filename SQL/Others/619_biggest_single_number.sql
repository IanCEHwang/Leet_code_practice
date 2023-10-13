select 
    case 
        when count(L.num) = 0 then NULL
        else num end as num
from (
    select num , count(num) as cnt
    from mynumbers
    group by num
    having cnt = 1
    order by num desc
) L
limit 1