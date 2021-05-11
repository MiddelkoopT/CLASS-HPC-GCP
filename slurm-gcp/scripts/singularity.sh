#!/usr/bin/env bash

yum groupinstall -y 'Development Tools'
yum install -y \
     openssl-devel \
     libuuid-devel \
     libseccomp-devel \
     wget \
     squashfs-tools \
     cryptsetup

export GOLANG_VERSION=1.16.4
export SINGULARITY_VERSION=3.7.0

install -dvp /opt/go/${GOLANG_VERSION}
install -dvp /opt/singularity/${SINGULARITY_VERSION}

export OS=linux
export ARCH=amd64

cd /opt/go/${GOLANG_VERSION}

wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz
tar -xzf go1.16.4.linux-amd64.tar.gz
rm go1.16.4.linux-amd64.tar.gz
#rm go$GOLANG_VERSION.$OS-$ARCH.tar.gz

export GOPATH=/var/tmp/go
export GOCACHE=/var/tmp/go/.cache/go-build
mkdir -p ${GOPATH}/{bin,pkg,src}

cd /opt/singularity/${SINGULARITY_VERSION}
#wget https://github.com/hpcng/singularity/releases/download/v3.7.0/singularity-3.7.0.tar.gz
wget https://github.com/hpcng/singularity/releases/download/v${SINGULARITY_VERSION}/singularity-${SINGULARITY_VERSION}.tar.gz
tar -xzf singularity-${SINGULARITY_VERSION}.tar.gz
rm -xzf singularity-${SINGULARITY_VERSION}.tar.gz
cd singularity

mkdir -p /apps/singularity/${SINGULARITY_VERSION}
export PATH=/opt/go/${GOLANG_VERSION}/go/bin:$PATH

./mconfig --prefix=/apps/singularity/${SINGULARITY_VERSION}
make -C ./builddir
make -C ./builddir install

rm -rf ${GOPATH}

mkdir /apps/modulefiles/singularity

bash -c "cat > /apps/modulefiles/singularity/${SINGULARITY_VERSION}" <<SINGULARITY_MODULEFILE
#%Module1.0#####################################################################
##
## modules singularity/${SINGULARITY_VERSION}.
##
## modulefiles/singularity/${SINGULARITY_VERSION}.
##
proc ModulesHelp { } {
        global version modroot
        puts stderr "singularity/${SINGULARITY_VERSION} - sets the environment for Singularity ${SINGULARITY_VERSION}"
}
module-whatis   "Sets the environment for using Singularity ${VERSION}"
# for Tcl script use only
set     topdir          /apps/singularity/${SINGULARITY_VERSION}
set     version         ${SINGULARITY_VERSION}
set     sys             linux86
prepend-path    PATH            /apps/singularity/${SINGULARITY_VERSION}/bin
SINGULARITY_MODULEFILE
