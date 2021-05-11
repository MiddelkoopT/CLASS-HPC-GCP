#!/bin/bash

echo "=== spack.sh $(hostname) $(date)"

sudo yum install -y epel-release
sudo yum install -y git python3 ca-certificates procps curl unzip jq
sudo yum install -y gcc gcc-c++ make patch file bzip2 xz

sudo install -dv /apps/spack
sudo chown $USER /apps/spack
git clone --depth=1 https://github.com/spack/spack.git /apps/spack

. /apps/spack/share/spack/setup-env.sh
spack install lmod python py-pip miniconda3

echo "=== spack.sh $(hostname) $(date) done"
