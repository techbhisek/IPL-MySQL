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
select * from(
SELECT 
  Rank() over(order by SUM(batsman_runs + noball_runs + wide_runs) * 6 / COUNT(CASE
        WHEN noball_runs = 0 AND wide_runs = 0 THEN bowler
        ELSE NULL
    END)) position,bowler,
SUM(batsman_runs + noball_runs + wide_runs) * 6 / COUNT(CASE
        WHEN noball_runs = 0 AND wide_runs = 0 THEN bowler
        ELSE NULL
    END) AS economy
FROM
    Deliveries
WHERE
    is_super_over != 0
GROUP BY bowler) t1 where position=1