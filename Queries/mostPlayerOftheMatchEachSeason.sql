SELECT season, player_of_match, times FROM(
   SELECT season,player_of_match ,count(player_of_match) AS times , 
		Rank() OVER(PARTITION BY season ORDER BY count(*) DESC)  position 
		FROM 
			Matches
		WHERE
			player_of_match!=""
		GROUP BY 
			season,player_of_match) t1 
WHERE
 position=1;