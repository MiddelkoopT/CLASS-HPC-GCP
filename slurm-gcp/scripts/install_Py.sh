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
gcp@sixy scripts % more install_Py.sh
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