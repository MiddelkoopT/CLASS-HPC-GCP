conda_version=4.9.2
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
chmod +x /tmp/miniconda.sh
/tmp/miniconda.sh -b -p /apps/miniconda/$conda_version -f
/apps/miniconda/$conda_version/bin/conda install jupyter -y

#conda_version=$( /apps/miniconda/bin/conda --version | awk '{print $2}')
mkdir -p /apps/modulefiles/miniconda
bash -c "cat > /apps/modulefiles/miniconda/${conda_version}" << CONDA_MODULEFILE
#%Module1.0#####################################################################
##
## modules miniconda/conda_version 
##
## modulefiles/miniconda/conda_version
##
proc ModulesHelp { } {
        global version modroot
        puts stderr "miniconda/$conda_version - sets the environment for miniconda"
}
module-whatis   "Sets the environment for using miniconda"
# for Tcl script use only
set     topdir          /apps/miniconda/$conda_version
set     version         $conda_version
set     sys             linux86
prepend-path    PATH            /apps/miniconda/$conda_version/bin
CONDA_MODULEFILE

