#!/bin/bash

gcloud compute ssh class-controller -- < scripts/controller.sh

gcloud compute ssh class-controller -- sudo -i < scripts/singularity.sh
gcloud compute ssh class-controller -- < scripts/spack.sh
