#!/bin/bash

# menggabungkan data dengan csvstack
echo "========== combining data, processing please wait.."
csvstack data/2019-Oct-sample.csv data/2019-Nov-sample.csv > data/total-raw.csv
echo "========== successfully created: data/total-raw.csv"