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
        requested_at
    from acceptedRides a
    left join rides r
    on a.ride_id = r.ride_id
)

select
    month,
    count(distinct d.driver_id) as active_drivers,
    count(c.ride_id) as accepted_rides
from month_table m
left join drivers d
on (month(d.join_date) < m.month + 1 and year(d.join_date) = 2020) or year(d.join_date) < 2020
left join cte c
on month(c.requested_at) = m.month and year(c.requested_at) = 2020 and c.driver_id = d.driver_id
group by month