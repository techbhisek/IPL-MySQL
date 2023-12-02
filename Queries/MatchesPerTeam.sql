SELECT 
    season, COUNT(*) AS Matches
FROM
    Matches
GROUP BY season
ORDER BY season;

