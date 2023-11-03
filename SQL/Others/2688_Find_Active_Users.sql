select
    distinct u1.user_id
from users u1
left join users u2
on u1.user_id = u2.user_id and datediff(u1.created_at , u2.created_at) between 0 and 7
where u2.created_at is not null
group by u1.user_id , u1.created_at
having count(u2.user_id) > 1