#!/bin/bash
echo please, enter the column number for the city you want to find the average crime

read column_number

numOfLine=$(tail -n +2 crimedata-australia.csv | wc -l)
total=0
for line in $(tail -n +2 crimedata-australia.csv | cut -d"," -f$column_number); do
       total=$(($total+$(echo $line)))
done

echo $(($total / $numOfLine))

