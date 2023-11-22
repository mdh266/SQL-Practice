SELECT
    player_id,
    event_date AS first_login
FROM (
    SELECT
        player_id,
        event_date,
        RANK() OVER(PARTITION BY player_id ORDER BY event_date ASC) AS event_rnk
    FROM
        Activity
) BASE
WHERE event_rnk = 1
;