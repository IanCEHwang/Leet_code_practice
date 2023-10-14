with cte as(
    select project_id , count(employee_id) as cnt
    from project
    group by project_id
    )
select project_id
from cte
where cnt = (select max(cnt) from cte)

