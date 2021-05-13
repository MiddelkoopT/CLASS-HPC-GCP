#!/bin/bash

## Run on the CLASS Slurm Compute node on build.

echo "=== custom-compute-install.sh $(hostname) $(date)"

echo "+++ spack"
cat >> /etc/profile.d/spack.sh <<EOF
if [ -d /apps/spack ] ; then
    source /apps/spack/share/spack/setup-env.sh
fi
EOF

echo "=== custom-compute-install.sh $(hostname) $(date) Done"
