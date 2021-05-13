#!/bin/bash

## Run on the CLASS Slurm Controller node on build.
# Lightweight and hard-to-do in the ssh based configuration scripts.

echo "=== custom-controller-install.sh $(hostname) $(date)"

echo "+++ spack"
cat >> /etc/profile.d/spack.sh <<EOF
if [ -d /apps/spack ] ; then
    source /apps/spack/share/spack/setup-env.sh
fi
EOF

echo "=== custom-controller-install.sh $(hostname) $(date) Done"
