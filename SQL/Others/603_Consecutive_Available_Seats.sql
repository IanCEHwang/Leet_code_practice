with cte as(
    select 
        c2.seat_id,
        count(c2.free) over (partition by c1.seat_id) as free_seats
    from cinema c1
    left join cinema c2
    on c2.seat_id - c1.seat_id between 0 and 1
    where c2.free = 1)

select distinct seat_id
from cte 
where free_seats >=2
order by seat_id