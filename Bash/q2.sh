#!/bin/bash

echo $(($(head -n 1 crimedata-australia.csv| sed 's/[^,]/ /g' | wc -w) + 1))
