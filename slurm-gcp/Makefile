#
#
# I2 Capstone Project
# Allissa Dillman, Ananya Ravipati, Bala Desinghu, Tony Cricell, John Hicks, Timothy Middelkoop
#
.PHONY: init plan apply destroy

init:
	terraform init

validate:
	terraform validate

plan:
	terraform plan -var-file=basic.tfvars -var-file=local.tfvars -out terraform.tfplan

apply:
	terraform apply -var-file=basic.tfvars -var-file=local.tfvars -auto-approve

destroy:
	terraform destroy -var-file=basic.tfvars -var-file=local.tfvars -auto-approve

show:
	terraform show
