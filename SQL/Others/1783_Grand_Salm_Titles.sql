select 
    player_id,
    player_name,
    sum(wimbledon = player_id) + sum(fr_open = player_id) + sum(us_open = player_id) + sum(au_open = player_id) as grand_slams_count  
from championships , players
group by player_id
having grand_slams_count <> 0
