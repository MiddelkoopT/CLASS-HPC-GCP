#!/bin/bash

# Run on class-controller node.
# gcloud compute ssh class-controller -- < setup.sh

echo "=== setup.sh $(hostname) $(date)"

# TODO: wait for slurm to configure
# MOTD displays:
# *** Slurm is currently being configured in the background. ***

echo "+++ configure"

CONTROLLER=$(hostname)
K8S=class-container-cluster

export ZONE=$(gcloud compute instances list --filter="name=('$CONTROLLER')" --format='value(zone)')

sudo yum install -y kubectl
gcloud container clusters get-credentials --zone=$ZONE $K8S

kubectl get nodes

echo "+++ spack"
sudo yum install -y epel-release
sudo yum install -y git python3 ca-certificates procps curl unzip jq
sudo yum install -y gcc gcc-c++ make patch file bzip2 xz

sudo install -dv /apps/spack
sudo chown $USER /apps/spack
git clone --depth=1 https://github.com/spack/spack.git /apps/spack


NODES=$(sinfo -p debug -h -Onodes)
CPUS=$(sinfo -p debug -h -Ocpus)

cat > build-spack.sh <<EOF
#!/bin/bash
echo "+++ \$(hostname) \$(date) \$SLURM_JOB_ID CPUS:\$SLURM_CPU_PER_TASK"
. /apps/spack/share/spack/setup-env.sh
srun -n $NODES --exclusive spack install lmod python py-pip miniconda3
EOF
sbatch -N $NODES --exclusive ./build-spack.sh

# for I in class-compute-0-{0..7} ; do echo $I ; ssh -o stricthostkeychecking=no $I ps -fe \| grep spack ; done

echo "=== setup.sh $(hostname) $(date) done"
