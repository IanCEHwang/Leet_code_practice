select
    distinct title
from tvprogram t
left join content c
on t.content_id = c.content_id
where program_date like '2020-06%' and Kids_content = 'Y' and content_type = 'Movies'