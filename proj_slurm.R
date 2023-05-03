rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
# if(length(args) == 1){
#   RpackagesDir = args[1]
# } else {
#   cat('usage: Rscript singleR.R <RpackagesDir>\n', file=stderr())
#   stop()
# }

file_name = args[2]
RpackagesDir = args[1]

# Tell R to search in RpackagesDir, in addition to where it already
# was searching, for installed R packages.
.libPaths(new=c(RpackagesDir, .libPaths()))
if (!require("arrow")) { # If loading package fails ...
  # Install package in RpackagesDir.
  install.packages(pkgs="arrow", lib=RpackagesDir, repos="https://cran.r-project.org")
  stopifnot(require("arrow")) # If loading still fails, quit.
}

trips = read_parquet(file_name)

small_trips <- trips[, c("trip_time", "trip_miles", "driver_pay", "tips")]
small_trips$index <- 1:nrow(small_trips)

output_file_name <- paste0(substring(file_name, 16, 22), ".csv")

write.csv(head(small_trips, 100000), file = output_file_name, row.names = FALSE)
