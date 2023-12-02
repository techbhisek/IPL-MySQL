SELECT 
    datain.season, player, count
FROM
    ((SELECT 
        season, MAX(count) AS maxcount
    FROM
        (SELECT 
        season, player_of_match, COUNT(player_of_match) AS count
    FROM
        Matches
    WHERE
        player_of_match != ''
    GROUP BY season , player_of_match
    ORDER BY season , COUNT(player_of_match) DESC) d1
    GROUP BY season) datain
    JOIN (SELECT 
        season,
            player_of_match AS player,
            COUNT(player_of_match) AS count
    FROM
        Matches
    WHERE
        player_of_match != ''
    GROUP BY season , player_of_match
    ORDER BY season , COUNT(player_of_match) DESC) data2 ON datain.season = data2.season
        AND datain.maxcount = data2.count);


