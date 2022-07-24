# Data Cleaning in Shell

With `cleaner_app.sh`, user can clean up csv data consists of traffic ecommerce data on October and November 2019.

# Process :

1. Download the [data](https://drive.google.com/file/d/1rKkUQU-sXIDka3rVNBahp6q3wDhrPY-1/view)

2. Unzip the file in working directory inside the `data` directory

3. Create a `cleaner_app.sh` consists of several commands:

- combining data with csvstack

```
csvstack data/2019-Oct-sample.csv data/2019-Nov-sample.csv > data/total-raw.csv
```

-filtering data

```
csvgrep -c "event_type" -m "purchase" data/total-raw.csv | csvcut -c event_time,event_type,product_id,category_id,brand,price > data/filtered.csv
```

- editing data

```
echo $"category, product_name" > data/edited.csv
grep "purchase" data/total-raw.csv | awk -F "," '{print $6}' | awk -F "." '{print $1","$NF}' >> data/edited.csv
```

- joining data

```
csvjoin data/filtered.csv data/edited.csv > data/data_clean.csv
```

4. Add `.gitignore` and put all big csv files inside (beside the data_clean.csv)

# How to Use:

1. Clone this repository
2. Download the file
3. Unzip in /data
4. Run `bash cleaner_app.sh`
5. Process cleaning is done
6. Re-run `bash cleaner_app.sh` to see the validated results

# Test Case

```
if [[ -f "data/data_clean.csv" ]]; then
  echo "========== validated result:"
  cat data/data_clean.csv | grep electronics | grep smartphone| awk -F ',' '{print $5}'| sort | uniq -c | sort -nr
  echo "========== word count:"
  cat data/data_clean.csv | wc
else
  **cleaning process here**
```

Result:
![result](https://raw.githubusercontent.com/edycakra/shellDataCleaning/main/images/1.png)
