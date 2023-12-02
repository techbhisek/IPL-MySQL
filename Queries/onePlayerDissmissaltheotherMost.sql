SELECT 
    batsman, bowler, COUNT(*) AS times
FROM
    Deliveries
WHERE
    dismissal_kind NOT IN ('run out' , 'retired hurt')
        AND player_dismissed != ''
GROUP BY batsman , bowler
ORDER BY COUNT(*) DESC
LIMIT 1;