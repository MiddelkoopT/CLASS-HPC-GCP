#!/usr/bin/env bash

mkdir /apps/Anaconda  &&  cd /apps/Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
bash Anaconda3-5.3.1-Linux-x86_64.sh -b -p /apps/Anaconda/5.3.1
rm -rf  Anaconda3-5.3.1-Linux-x86_64.sh
