#!/bin/bash

#
# This script installs kubernetes and apps listed below on slurm cluster
#
# not sure why I had to add the ZONE variable to this for me to run,
# I see that it is defined in the other scripts. It could be my version of
# gcloud
#

ZONE="us-central1-c"

gcloud compute ssh class-controller --zone=$ZONE  -- < scripts/controller.sh

gcloud compute ssh class-controller --zone=$ZONE -- sudo -i < scripts/singularity.sh
gcloud compute ssh class-controller --zone=$ZONE -- sudo -i < scripts/install_miniconda.sh
gcloud compute ssh class-controller --zone=$ZONE -- < scripts/spack.sh
gcloud compute ssh class-controller --zone=$ZONE -- < scripts/install_R.sh
gcloud compute ssh class-controller --zone=$ZONE -- < scripts/install_Py.sh
