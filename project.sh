#!/bin/bash

#wget $1 --no-check-certificate

#rscript proj.R $1 
if wget $1 --no-check-certificate; then
    echo "wget was successful"
else
    echo "wget failed"
fi
