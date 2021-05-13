#
# I2 Capstone Project
# Allissa Dillman, Ananya Ravipati, Bala Desinghu, Tony Cricell, John Hicks, Timothy Middelkoop
#

# Location of https://github.com/SchedMD/slurm-gcp scripts folder
SCRIPTS=../../slurm-gcp/scripts

.PHONY: scripts init validate plan apply destroy

scripts: ${SCRIPTS}/custom-controller-install ${SCRIPTS}/custom-compute-install

# Customizations of the build scripts.
${SCRIPTS}/custom-controller-install: scripts/custom-controller-install.sh
	ln -sfn $$PWD/scripts/custom-controller-install.sh ${SCRIPTS}/custom-controller-install

# Login node uses the custom-compute-install script
${SCRIPTS}/custom-compute-install: scripts/custom-compute-install.sh
	ln -sfn $$PWD/scripts/custom-compute-install.sh ${SCRIPTS}/custom-compute-install

init: scripts
	terraform init

validate: scripts
	terraform validate

plan: scripts
	terraform plan -var-file=basic.tfvars -var-file=local.tfvars -out terraform.tfplan

apply: scripts
	terraform apply -var-file=basic.tfvars -var-file=local.tfvars -auto-approve

destroy:
	terraform destroy -var-file=basic.tfvars -var-file=local.tfvars -auto-approve

show:
	terraform show
