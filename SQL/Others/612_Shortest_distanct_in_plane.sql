with cte as(
    select
        round(power(power(p1.x - p2.x , 2) + power(p1.y - p2.y , 2) , 0.5) , 2) as distance
    from point2d p1
    left join point2d p2
    on p1.x <> p2.x or p1.y <> p2.y)

select min(distance) as shortest
from cte