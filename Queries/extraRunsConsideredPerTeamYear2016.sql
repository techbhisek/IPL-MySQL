SELECT 
    bowling_team, SUM(extra_runs)
FROM
    Matches
        JOIN
    Deliveries ON Matches.id = Deliveries.Match_id
        AND Matches.season = 2016
WHERE
    extra_runs != 0
GROUP BY bowling_team;