with friend as(
select 
  user1_id as user1_id, 
  user2_id as user2_id
from friendship
union all
select 
  user2_id as user1_id, 
  user1_id as user2_id
from friendship
order by 1),

recm as(
select f.user1_id, l.*
from friend f
join likes l on f.user2_id = l.user_id 
left join likes l2 on f.user1_id = l2.user_id and l.page_id = l2.page_id
where l2.page_id is null
)

select 
  user1_id as user_id, 
  page_id, 
  count(user1_id) as friends_likes
from recm