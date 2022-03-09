#!/bin/bash
echo Hi, please enter the column number to find number of crimes for the city

read column_number

total=0
for line in $(tail -n +2 crimedata-australia.csv | cut -d"," -f$column_number); do
       total=$(($total+$(echo $line)))
done

echo $total
