SELECT PLAYER_ID , EVENT_DATE ,
  SUM(GAMES_PLAYED) OVER (PARTITION BY PLAYER_ID ORDER BY EVENT_DATE) AS GAMES_PLAYED_SO_FAR
  FROM ACTIVITY
