SELECT count(*) AS superstar FROM players INNER JOIN teams ON players.team = teams.team WHERE ranking<10 AND minutes>350;
