with recursive cte as(
    select
        min(period_start) as date
    from sales
    union all
    select
        date_add(date , interval 1 day)
    from cte
    where date < (select max(period_end) from sales)
)
select
    s.product_id,
    p.product_name,
    cast(year(c.date) as char) as report_year,
    count(date) * average_daily_sales as total_amount
from sales s 
left join cte c
on c.date between s.period_start and s.period_end
left join product p
on p.product_id = s.product_id
group by s.product_id , average_daily_sales , year(c.date)
order by s.product_id , report_year