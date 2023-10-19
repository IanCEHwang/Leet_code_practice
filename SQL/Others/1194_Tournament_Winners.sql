with cte as(
    select
        first_player as player,
        first_score as score
    from matches
    union all
    select
        second_player as player,
        second_score as score
    from matches
),
cte2 as (
    select
        player,
        sum(score) as ttl_points
    from cte
    group by player
),
cte3 as(
    select
        group_id,
        p.player_id,
        ttl_points,
        max(ttl_points) over (partition by group_id) as max_point
    from players p
    left join cte2 c
    on p.player_id = c.player)

select 
    group_id as GROUP_ID,
    min(player_id) as PLAYER_ID
from cte3
where max_point = ttl_points
group by group_id
