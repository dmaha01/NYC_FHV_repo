#!/bin/bash

# if wget https://d37ci6vzurychx.cloudfront.net/trip-data/fhvhv_tripdata_2019-02.parquet --no-check-certificate ; then
#    echo "wget was successful"
# else
#    echo "wget failed"
# fi

file = $(wget https://d37ci6vzurychx.cloudfront.net/trip-data/fhvhv_tripdata_2019-02.parquet --no-check-certificate)

module load R/R-3.6.

RpackagesDir="R/library" # the R script will install packages here                                                                                                                          
mkdir --parents "$RpackagesDir" # make directory & parents; no error if exists                                                                                                         

Rscript proj_slurm.R "$RpackagesDir" $file
