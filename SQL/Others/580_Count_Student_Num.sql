select dept_name , 
        case 
            when num_of_student is null then 0
            else num_of_student end as 'student_number'
from department d
left join (
    select 
        dept_id,
        count(student_id) as num_of_student
    from student
    group by dept_id
) T
on d.dept_id = T.dept_id
order by num_of_student desc , dept_name 