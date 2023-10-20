with post as(
    select distinct sub_id as post_id
    from submissions 
    where parent_id is null
),
comment as(
    select distinct sub_id , parent_id as post_id
    from submissions
    where parent_id is not null
)
select 
    p.post_id,
    count(sub_id) as number_of_comments
from post p
left join comment c
on p.post_id = c.post_id
group by p.post_id
order by p.post_id