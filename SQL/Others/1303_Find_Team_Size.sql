with cte as (
    select
        team_id,
        count(employee_Id) as team_size
    from employee
    group by team_id
)

select
    employee_id,
    c.team_size
from employee e
left join cte c
on e.team_id = c.team_id
order by employee_id