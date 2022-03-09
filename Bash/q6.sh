#!/bin/bash
lowest=1000000

city_name="lol"
num_of_columns=$(($(head -n 1 crimedata-australia.csv| sed 's/[^,]/ /g' | wc -w) + 1))
for((i=2;i<=num_of_columns;i++)); do
total=0
for line in $(tail -n +2 crimedata-australia.csv | cut -d"," -f$i); do
       total=$(($total+$(echo $line)))
done
if [ $total -lt $lowest ]; then
lowest=$total
city_name=$(head -n 1 crimedata-australia.csv | cut -d"," -f$i)
#now we sort a bit like bubble sort
fi
done

echo $city_name
