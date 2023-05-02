#!/bin/bash

#wget $1 --no-check-certificate

#rscript proj.R $1 
file = $(wget https://d37ci6vzurychx.cloudfront.net/trip-data/$1 --no-check-certificate)
#    echo "wget was successful"
 #   echo "file=$1."
#else
 #   echo "wget failed"
#fi

tar -xzf R413.tar.gz
tar -xzf packages.tar.gz

export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages

Rscript proj.R $file
