with recursive cte1 as (
    select
      count(amount) as transactions
    from visits v
    left join transactions t
    on v.user_id = t.user_id and v.visit_date = t.transaction_date
    group by v.user_id, v.visit_date
),
cte2 as (
    select
        transactions as transactions_count,
        count(transactions) as visits_count
    from cte1
    group by transactions
),
count_table as (
  select 0 as transactions_count
  union all
  select
    transactions_count + 1 from
    count_table
  where
    transactions_count < (
      select
        max(transactions_count) as max_transactions_count
      from
        cte2
    )
)

select 
  c.transactions_count,
  case when c2.visits_count is null then 0
  else c2.visits_count end as visits_count
from count_table c 
left join cte2 c2 
on c.transactions_count = c2.transactions_count 