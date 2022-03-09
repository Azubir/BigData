SELECT players.surname, players.minutes, players.team FROM players INNER JOIN teams ON players.team = teams.team WHERE games>4 AND position = "goalkeeper";
