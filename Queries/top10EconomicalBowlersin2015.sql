SELECT 
    bowler,
   SUM(batsman_runs + noball_runs + wide_runs)*6/
    COUNT(CASE
        WHEN noball_runs = 0 AND wide_runs = 0 THEN bowler
        ELSE null
    END) AS Economy
FROM
    Matches
        JOIN
    Deliveries ON Matches.id = Deliveries.Match_id
        AND Matches.season = 2015
GROUP BY bowler order by Economy Limit 10;
