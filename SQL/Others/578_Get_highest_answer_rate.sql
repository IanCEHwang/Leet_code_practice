with cte as(
    select 
        question_id,
        sum(case when
                    action = 'answer' then 1
                    else 0 end) / 
        sum(case when
                    action = 'show' then 1
                    else 0 end) as percentage
    from surveylog
    group by question_id)

select question_id as survey_log
from cte
order by percentage desc , question_id 
limit 1