WITH artist_counts AS (
SELECT
  artist_name,
  COUNT(1) AS ct
FROM (
  SELECT 
    a.artist_name,
    s.song_id
  FROM 
    artists AS a
  LEFT JOIN 
    songs AS s
  ON  
    a.artist_id = s.artist_id
) AS base
LEFT JOIN 
  global_song_rank AS g 
ON  
  base.song_id = g.song_id
WHERE 
  g.rank <= 10
GROUP BY 1
)

SELECT 
  artist_name,
  artist_rank
FROM (
  SELECT
    artist_name,
    DENSE_RANK() OVER (ORDER BY ct DESC) AS artist_rank
  FROM 
    artist_counts
  ORDER BY ct DESC
  ) base
WHERE artist_rank <= 5 
ORDER BY 2 ASC 