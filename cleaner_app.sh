#!/bin/bash

# # menggabungkan data dengan csvstack
# echo "========== combining data, processing please wait.."
# csvstack data/2019-Oct-sample.csv data/2019-Nov-sample.csv > data/total-raw.csv
# echo "========== successfully created: data/total-raw.csv"

# # memfilter data berdasarkan event_type "purchase" dan menyeleksi kolom yang relevan untuk analisis produk dengan csvgrep (filter by row) dan csvcut (filter by column)
# echo "========== filtering data, processing please wait.."
# csvgrep -c "event_type" -m "purchase" data/total-raw.csv | csvcut -c event_time,event_type,product_id,category_id,brand,price > data/filtered.csv
# echo "========== successfully created: data/filtered.csv"

# melakukan splitting data kategori produk dan nama produk pada kolom category_code dengan cara mengambil element pertama dan terakhir dari splitted element
echo "========== editing data, processing please wait.."
echo "========== initialize new columns: category, product_name"
echo $"category, product_name" > data/edited.csv
echo "========== successfully created: data/edited.csv"
echo "========== continue splitting data, processing please wait.."
grep "purchase" data/total-raw.csv | awk -F "," '{print $6}' | awk -F "." '{print $1","$NF}' >> data/edited.csv
echo "========== successfully splitting data: data/edited.csv"