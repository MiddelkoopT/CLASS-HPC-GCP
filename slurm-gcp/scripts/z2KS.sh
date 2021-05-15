#!/bin/sh
#
#
#  This script will install a working slurm cluster
#  on GCP completly from command line.
#  set the below variables and execute the script.
#
#  Inline documentation explains what each section does.
#
#  Zero to Kubernetes and Slurm with one command
#
#  This script should be run in the slurm-gcp folder
#  un-comment the bash setup to install kubernetes and other apps.
#

GCLOUDUSER=""
PROJECT_ID=""
SAUSER=""
ZONE=""
FOLDER_ID=""

#
# Set project defaults
#
gcloud config set account $GCLOUDUSER
gcloud projects create $PROJECT_ID --folder=$FOLDER_ID
gcloud config set project $PROJECT_ID

#
# Enable API we will use
#
gcloud services enable compute.googleapis.com iam.googleapis.com container.googleapis.com file.googleapis.com

#
# Create service account we will use to manage project
#
gcloud iam service-accounts create $SAUSER --display-name "$SAUSER-$PROJECT_ID"

#
# Assign needed roles to SA
#
gcloud projects add-iam-policy-binding $PROJECT_ID --member serviceAccount:$SAUSER@$PROJECT_ID.iam.gserviceaccount.com --role='roles/editor'
gcloud projects add-iam-policy-binding $PROJECT_ID --member serviceAccount:$SAUSER@$PROJECT_ID.iam.gserviceaccount.com --role='roles/iam.securityAdmin'

#
# Download credentials needed for terraform files
#
gcloud iam service-accounts keys create credentials.gcp --iam-account=$SAUSER@$PROJECT_ID.iam.gserviceaccount.com

#
# add files that should be ignored  when pushing files to repository
#
echo "credentials.gcp" >>.gitignore
echo "local*" >>.gitignore

#
# Initialize Terraform
#
echo " Initialize Terraform"
make init
sleep 30

#
# Validate our setup files
#
echo " Validating Terraform input files"
make validate
sleep 30

#
# By default, creating a plan consists of: Reading the current state of any already-existing remote objects to make sure
# that the Terraform state is up-to-date. Comparing the current configuration to the prior state and noting any differences.
#
#
echo " Running Terraform plan"
make plan
sleep 30

#
# Now execute the actions proposed in our plan
#
echo " Applying Terraform plan"
make apply

#
#
#  Commands to run after the cluster is made to test
#
#   *   gcloud compute instances list
#   *   gcloud beta compute ssh --zone "$ZONE" "class-login0" --project "$PROJECT_ID"
#   *   sinfo
#   *   srun hostname
#
#
#  Now that the cluster is built and verified working:
#  We run the setup.sh script which will install default apps
#  like kubernetes,  miniconad, SPAC

# bash setup.sh

#
# Tear the entire cluster down with the following command
#
#  make destroy
#
