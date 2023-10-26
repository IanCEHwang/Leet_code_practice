with recursive month_table as (
    select
        1 as month
    union all
    select
        month + 1 as month
    from month_table
    where month <= 11
),
cte as(
    select
        a.ride_id,
        driver_id,
        requested_at,
        ride_distance,
        ride_duration
    from acceptedRides a
    left join rides r
    on a.ride_id = r.ride_id
),
cte2 as(
    select
        month,
        coalesce(sum(ride_distance) , 0) as ride_distance,
        coalesce(sum(ride_duration) , 0) as ride_duration
    from month_table m
    left join drivers d
    on (month(d.join_date) < m.month + 1 and year(d.join_date) = 2020) or year(d.join_date) < 2020
    left join cte c
    on month(c.requested_at) = m.month and year(c.requested_at) = 2020 and c.driver_id = d.driver_id
    group by month)

select 
    c2.month,
    round(sum(c22.ride_distance) / 3 ,2) as average_ride_distance,
    round(sum(c22.ride_duration) / 3 , 2) as average_ride_duration
from cte2 c2
left join cte2 c22
on c22.month - c2.month between 0 and 2
group by c2.month
having month <= 10