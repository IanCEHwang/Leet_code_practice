with cte as(
    select
        student_id,
        student_name
    from student
    where student_id in (
        select
            distinct student_id
        from exam
    )
),
cte2 as(
    select
        exam_id,
        max(score) max_score,
        min(score) min_score
        from exam
        group by exam_id),
cte3 as(
    select
        distinct e.student_id
    from exam e
    left join cte2 c2 on 
    c2.exam_id = e.exam_id and c2.max_score = e.score
    left join cte2 c22 on
    c22.exam_id = e.exam_id and c22.min_score = e.score
    where c2.max_score is not null or c22.min_score is not null
)

select 
    student_id,
    student_name
from cte
where student_id not in (
    select
        student_id
    from cte3
)