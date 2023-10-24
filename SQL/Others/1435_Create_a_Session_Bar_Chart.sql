select '[0-5>' as bin, sum(
    case when duration >= 0 and duration < 300 then 1 else 0 end
) as total from sessions
union 
select '[5-10>' as bin, sum(
    case when duration >= 300 and duration < 600 then 1 else 0 end
) as total from sessions
union 
select '[10-15>' as bin, sum(
    case when duration >= 600 and duration < 900 then 1 else 0 end
) as total from sessions
union 
select '15 or more' as bin, sum(
    case when duration >= 900 then 1 else 0 end
) as total from sessions