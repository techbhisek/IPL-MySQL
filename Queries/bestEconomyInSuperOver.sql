SELECT 
    t1.bowler, CEIL(t1.runs / t2.overs) AS Economy
FROM
    (SELECT 
        bowler, SUM(batsman_runs + noball_runs + wide_runs) AS runs
    FROM
        Deliveries
    WHERE
        is_super_over != 0
    GROUP BY bowler) t1
        JOIN
    (SELECT 
        bowler, COUNT(*) / 6 AS overs
    FROM
        Deliveries
    WHERE
        is_super_over != 0 && noball_runs = 0
            && wide_runs = 0
    GROUP BY bowler) t2 ON t1.bowler = t2.bowler
ORDER BY runs / overs
LIMIT 1;