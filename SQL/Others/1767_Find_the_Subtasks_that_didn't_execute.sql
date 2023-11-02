with recursive cte as(
    select 
        1 as task_cnt
    union all
    select
        task_cnt + 1
    from cte
    where task_cnt< (
        select
            max(subtasks_count)
        from tasks
    )
)

select
    t.task_id,
    task_cnt as subtask_id
from tasks t
left join cte c
on c.task_cnt <= t.subtasks_count
left join executed e
on e.task_id = t.task_id and c.task_cnt = e.subtask_id
where e.subtask_id is null