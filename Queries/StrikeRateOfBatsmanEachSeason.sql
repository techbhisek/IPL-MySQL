SELECT 
    season,
    ((SUM(batsman_runs + noball_runs) / COUNT(*)) * 100) AS strikerate
FROM
    Matches
        JOIN
    Deliveries ON Deliveries.Match_id = Matches.id
WHERE
    batsman LIKE '%arner' AND wide_runs = 0
        AND noball_runs = 0
GROUP BY season
ORDER BY season;
