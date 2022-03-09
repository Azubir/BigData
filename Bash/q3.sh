#!/bin/bash

echo Enter column of the city please

read column_number

echo $(tail -n +2 crimedata-australia.csv | cut -d"," -f1,$column_number | sort -n -t "," -k2 -r| head -n 1)

