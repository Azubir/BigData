 #!/bin/bash

{
read
while IFS=',' read -r team1 ranking1 games1 wins1 draws1 losses1 goalsFor1 goalsAgainst1 yellowCards1 redCards1; do
echo  "insert into teams (team, ranking, games, wins, draws, losses, goalsFor, goalsAgainst, yellowCards, redCards) values ('$team1', '$ranking1','$games1','$wins1','$draws1','$losses1','$goalsFor1','$goalsAgainst1','$yellowCards1','$redCards1');" | mysql sport
done
} < Teams.csv 


team1=$(tail -1 Teams.csv | cut -d "," -f 1)
ranking1=$(tail -1 Teams.csv | cut -d "," -f 2)
games1=$(tail -1 Teams.csv | cut -d "," -f 3)
wins1=$(tail -1 Teams.csv | cut -d "," -f 4)
draws1=$(tail -1 Teams.csv | cut -d "," -f 5)
losses1=$(tail -1 Teams.csv | cut -d "," -f 6)
goalsFor1=$(tail -1 Teams.csv | cut -d "," -f 7)
goalsAgainst1=$(tail -1 Teams.csv | cut -d "," -f 8)
yellowCards1=$(tail -1 Teams.csv | cut -d "," -f 9)
redCards1=$(tail -1 Teams.csv | cut -d "," -f 10)

echo  "insert into teams (team, ranking, games, wins, draws, losses, goalsFor, goalsAgainst, yellowCards, redCards) values ('$team1', '$ranking1','$games1','$wins1','$draws1','$losses1','$goalsFor1','$goalsAgainst1','$yellowCards1','$redCards1');" | mysql sport


count=0
{
read
while IFS=, read -r surname1 team1 position1 minutes1 shots1 passes1 tackles1 saves1; do   
surname1=$(echo $surname1 | tr -d "\'")
team1=$(echo $team1 | tr -d "\'")
position1=$(echo $position1 | tr -d "\'")
minutes1=$(echo $minutes1 | tr -d "\'")
shots1=$(echo $shots1 | tr -d "\'")
passes1=$(echo $passes1 | tr -d "\'")
tackles1=$(echo $tackles1 | tr -d "\'")
saves1=$(echo $saves1 | tr -d "\'")
count=$((count+1))
echo  "insert into players (surname, team, position, minutes, shots, passes, tackles, saves) values ('$surname1', '$team1', '$position1', '$minutes1', '$shots1', '$passes1', '$tackles1', '$saves1');" | mysql sport
done
} < Players.csv

echo $count

surname1=$(tail -1 Players.csv | cut -d "," -f 1)
team1=$(tail -1 Players.csv | cut -d "," -f 2)
position1=$(tail -1 Players.csv | cut -d "," -f 3)
minutes1=$(tail -1 Players.csv | cut -d "," -f 4)
shots1=$(tail -1 Players.csv | cut -d "," -f 5)
passes1=$(tail -1 Players.csv | cut -d "," -f 6)
tackles1=$(tail -1 Players.csv | cut -d "," -f 7)
saves1=$(tail -1 Players.csv | cut -d "," -f 8)

echo  "insert into players (surname, team, position, minutes, shots, passes, tackles, saves) values ('$surname1', '$team1', '$position1', '$minutes1', '$shots1', '$passes1', '$tackles1', '$saves1');" | mysql sport
