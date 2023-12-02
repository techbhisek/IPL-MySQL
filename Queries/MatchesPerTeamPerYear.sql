SELECT 
    season, winner, COUNT(*)
FROM
    Matches
WHERE
    winner != ''
GROUP BY season , winner
ORDER BY season;