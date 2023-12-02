SELECT 
    winner, COUNT(winner) AS times
FROM
    Matches
WHERE
    winner = toss_winner
GROUP BY winner;