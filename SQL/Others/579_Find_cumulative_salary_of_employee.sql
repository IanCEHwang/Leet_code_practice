select e1.id , e1.month , sum(e2.salary) as Salary
from employee e1
left join employee e2 
on e1.month - e2.month between 0 and 2 and e1.id = e2.id
where (e1.id , e1.month) not in 
(
  select id , max(month)
  from employee
  group by id
  )
group by e1.id , e1.month
order by e1.id , e1.month desc
