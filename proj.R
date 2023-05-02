rm(list=ls())
args <- commandArgs(trailingOnly = TRUE)
# if(length(args) != 1){
#   cat("usage: Rscript proj.R args not listed\n")
#   quit(status = 1, save = "no")
# }

file_name <- args[1]
# file_name = "fhvhv_tripdata_2019-02.parquet"
library(arrow)

trips = read_parquet("2019-02.parquet")

small_trips <- trips[, c("trip_time", "trip_miles", "driver_pay", "tips")]
small_trips$index <- 1:nrow(small_trips)

output_file_name <- paste0(substring(file_name, 16, 22), ".csv")

write.csv(head(small_trips, 100000), file = output_file_name, row.names = FALSE)


