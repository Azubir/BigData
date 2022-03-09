#!/bin/bash


input="Teams.csv"
{
count=0
while IFS=, read -r -a var
do
if [ $count -gt 0  ]
then
echo "${var[-1]}"
mongo sportDB --eval 'db.teams.insert({team: "'"${var[0]}"'", ranking: "'"${var[1]}"'", games: "'"${var[2]}"'", wins: "'"${var[3]}"'", draws: "'"${var[4]}"'",  losses: "'"${var[5]}"'", goalsFor: '${var[6]}', goalsAgainst: '${var[7]}', yellowCards: "'"${var[8]}"'", redCards: "${var[-1]}" })'
fi
count=$((count+1))
done < "$input"
}

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
mongo sportDB --eval 'db.teams.insert({team: "'"$team1"'", ranking: "'"$ranking1"'", games: "'"$games1"'", wins: "'"$wins1"'", losses: "'"$draws1"'", goalsFor: '$goalsFor1', goalsAgainst: '$goalsAgainst1', yellowCards: "'"$yellowCards1"'", redCards: "'"$redCards1"'"})'

echo "completed"

input2="Players.csv"
{
countTwo=0
while IFS=, read -r -a varTwo
do
if [ $countTwo -gt 0  ]
then
echo ${varTwo[2]}
mongo sportDB --eval 'db.players.insert({surname: "'"${varTwo[0]}"'", team: "'"${varTwo[1]}"'", position: "'"${varTwo[2]}"'", minutes: "'"${varTwo[3]}"'", shots: "'"${varTwo[4]}"'", passes: '${varTwo[5]}', tackles: "'"${varTwo[6]}"'", saves: "${varTwo[-1]}"})'
fi
countTwo=$((countTwo+1))
done < "$input2"
}

surname1=$(tail -1 Players.csv | cut -d "," -f 1)
team1=$(tail -1 Players.csv | cut -d "," -f 2)
position=$(tail -1 Players.csv | cut -d "," -f 3)
minutes=$(tail -1 Players.csv | cut -d "," -f 4)
shots=$(tail -1 Players.csv | cut -d "," -f 5)
passes=$(tail -1 Players.csv | cut -d "," -f 6)
tackles=$(tail -1 Players.csv | cut -d "," -f 7)
saves=$(tail -1 Players.csv | cut -d "," -f 8)

mongo sportDB --eval 'db.players.insert({surname: "'"$surname1"'", team: "'"$team1"'", position: "'"$position1"'", minutes: "'"$minutes1"'", shots: "'"$shots1"'", passes: "'"$passes1"'", tackles: "'"$tackles1"'", saves: "'"$saves1"'"})'
