#!/usr/bin/env bash

mkdir -p ~/taxi-data

for i in `seq -w 1 12`; do
    wget -P ~/taxi-data https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2017-$i.csv;
done

