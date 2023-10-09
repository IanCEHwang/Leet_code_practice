with cte1 as(
    select count(R.requester_id) as accept_count 
    from (select distinct requester_id , accepter_id from requestaccepted) R),

cte2 as(
    select count(T.sender_id) as request_count
    from  (select distinct sender_id , send_to_id from friendrequest) T    
)

select 
    case when round((select accept_count from cte1) / request_count , 2) is null then 0
    else round((select accept_count from cte1) / request_count , 2) end as accept_rate 
from cte2