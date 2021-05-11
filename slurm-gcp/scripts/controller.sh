#!/bin/bash

# Run on class-controller node.
# gcloud compute ssh class-controller -- < controller.sh

echo "=== controller.sh $(hostname) $(date)"

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

echo "=== controller.sh $(hostname) $(date) done"
