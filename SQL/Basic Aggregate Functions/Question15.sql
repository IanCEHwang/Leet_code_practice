SELECT C.ID , C.MOVIE, C.DESCRIPTION , C.RATING
FROM CINEMA C
WHERE C.DESCRIPTION != 'boring' AND C.ID % 2 = 1
ORDER BY C.RATING DESC