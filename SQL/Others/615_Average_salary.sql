with cte as (
    select *,
            date_format(pay_date , '%Y-%m') as pay_month
    from salary 
),
cte2 as(
    select distinct 
            pay_month , 
            department_id , 
            avg(amount) over (partition by pay_month) as bench,
            avg(amount) over (partition by department_id , pay_month) as avg_amount
    from cte
    inner join employee e 
    on cte.employee_id = e.employee_id
)
select
    pay_month,
    department_id,
    case 
        when avg_amount > bench then 'higher'
        when avg_amount < bench then 'lower'
        else 'same' end as comparison
from cte2