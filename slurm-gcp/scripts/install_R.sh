#!/usr/bin/env bash

sudo yum-builddep -y python
sudo yum -y install yum-utils

sudo mkdir /apps/Python
cd /apps/Python
sudo wget https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tgz
sudo tar xzf Python-3.9.5.tgz
cd Python-3.9.5
sudo ./configure --prefix=/apps/Python/3.9.5
sudo make && sudo make install
cd ..
sudo rm -rf  Python-3.9.5 Python-3.9.5.tgz
gcp@sixy scripts % more install_R.sh
#!/usr/bin/env bash

sudo yum-builddep -y R
sudo yum -y install yum-utils

sudo mkdir /apps/R
cd /apps/R
sudo wget https://cran.rstudio.com/src/base/R-4/R-4.0.5.tar.gz
sudo tar xzf R-4.0.5.tar.gz
cd R-4.0.5
sudo ./configure --prefix=/apps/R/4.0.5 --enable-R-shlib
sudo make && sudo make install
cd ..
sudo rm -rf  R-4.0.5 R-4.0.5.tar.gz
