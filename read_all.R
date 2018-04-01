library(lubridate)
col_classes <- c('VendorID' = "factor",
                 'tpep_pickup_datetime' = "character",
                 'tpep_dropoff_datetime' = "character",
                 'passenger_count' = "integer",
                 'trip_distance' = "numeric",
                 'pickup_longitude' = "numeric",
                 'pickup_latitude' = "numeric",
                 'RateCodeID' = "factor",
                 'store_and_fwd_flag' = "factor",
                 'dropoff_longitude' = "numeric",
                 'dropoff_latitude' = "numeric",
                 'payment_type' = "factor",
                 'fare_amount' = "numeric",
                 'extra' = "numeric",
                 'mta_tax' = "numeric",
                 'tip_amount' = "numeric",
                 'tolls_amount' = "numeric",
                 'improvement_surcharge' = "numeric",
                 'total_amount' = "numeric")

input_xdf <- 'yellow_tripdata.xdf'
most_recent_date <- ymd('2018-01-01')

st <- Sys.time()

for(i in 1:12) {
  file_date <- most_recent_date - months(i)
  input_csv <- sprintf('taxi-data/yellow_tripdata_%s.csv', substr(file_date, 1, 7))
  append <- if (i == 1) "none" else "rows"
  rxImport(input_csv, input_xdf, colClasses=col_classes, overwrite=TRUE, append=append)
  print(input_csv)
}

Sys.time() - st

