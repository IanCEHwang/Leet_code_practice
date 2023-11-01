select
    e1.reports_to as employee_id,
    e2.name as name,
    count(e1.employee_id) as reports_count,
    round(avg(e1.age) , 0) as average_age
from employees e1
left join employees e2
on e1.reports_to = e2.employee_id
where e1.reports_to is not null
group by e1.reports_to, e2.name
order by e2.employee_id