select
    distinct l1.account_id
from loginfo l1
left join loginfo l2
on l2.login between l1.login and l1.logout and l1.account_id = l2.account_id and l1.ip_address <> l2.ip_address
where l2.account_id is not null