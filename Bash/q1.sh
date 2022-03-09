#!/bin/bash

echo $(tail -n +2 crimedata-australia.csv | wc -l)
