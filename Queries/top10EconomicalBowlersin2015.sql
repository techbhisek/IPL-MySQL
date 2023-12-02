SELECT 
    bowler, run / overs
FROM
    (SELECT 
        bowler, SUM(batsman_runs + wide_runs + noball_runs) AS run
    FROM
        Matches
    JOIN Deliveries ON Matches.id = Deliveries.Match_id
        AND Matches.season = 2015
    GROUP BY bowler
    ORDER BY SUM(batsman_runs + wide_runs + noball_runs)) d1
        JOIN
    (SELECT 
        bowler AS bowler1, COUNT(*) / 6 AS overs
    FROM
        Matches
    JOIN Deliveries ON Matches.id = Deliveries.Match_id
        AND Matches.season = 2015
        AND Deliveries.noball_runs = 0
        AND Deliveries.wide_runs = 0
    GROUP BY bowler
    ORDER BY SUM(batsman_runs + wide_runs + noball_runs)) d2 ON d1.bowler = d2.bowler1
ORDER BY run / overs
LIMIT 10;
