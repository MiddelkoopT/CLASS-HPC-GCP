#!/usr/bin/env bash

yum-builddep -y R
yum -y install yum-utils

mkdir /apps/R
cd /apps/R
wget https://cran.rstudio.com/src/base/R-4/R-4.0.5.tar.gz
tar xzf R-4.0.5.tar.gz
cd R-4.0.5
#./configure --prefix=/apps/R/4.0.5 --enable-R-shlib --enable-memory-profiling --with-blas --with-lapack
./configure --prefix=/apps/R/4.0.5 --enable-R-shlib
make && sudo make install
cd ..
rm -rf  R-4.0.5 R-4.0.5.tar.gz
