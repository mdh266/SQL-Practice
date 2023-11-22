SELECT
    ROUND(COUNT(1) / (SELECT COUNT(DISTINCT(player_id)) FROM Activity), 2) AS fraction
FROM (
    SELECT
        player_id,
        event_date,
        LEAD(event_date, 1) OVER (
            PARTITION BY player_id 
            ORDER BY event_date ASC) AS next_event,
        RANK() OVER (
            PARTITION BY player_id 
            ORDER BY event_date ASC) AS event_rank
    FROM 
        Activity
) T
WHERE
    event_rank = 1
AND 
    DATEDIFF(next_event, event_date) = 1
;