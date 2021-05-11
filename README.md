# CLASS-HPC-GCP
Internet2 CLASS Capstone Project,  HPC-GCP Team 

It is convenient to deploy an HPC cluster on the GCP cloud using terraform scripts. The scripts are inside the directory slurm-gcp. You need to edit the scripts - basic.tfvars and main.tf. For a basic deployment, it is sufficient to redefine a few variables such as project name, cluster name, etc. Of course, you can fine tune the variables and scripts to fit your needs. 

* Create a GCP Project (for example, class-capstone)
* Go to API services and enable the API for compute engines and deployment manager
* Start the cloud shell (If you set up the environment for gcloud shell or sdk on your laptop, you can use your development environment in place of cloud shell)
* Clone the gcp repo: git clone https://github.com/SchedMD/slurm-gcp.git
* Go to the directory slurm-gcp/tf/examples
* Make a copy of the basic example. `cp basic.tfvar.example basic.tfvar`
* Edit the basics.tfvar file. Add a line “project = class-capstone” (or any name you like)
* Open main.tf, and make sure that the bash variable `source` refers to the correct path
* Initialize terraform `terraform init`
* Start the HPC cluster. `terraform apply -var-file=basic.tfvars`. 
* Go to your GCP dashboard and check the compute engines. You should see the controller and the login node up and running. 
* SSH into the login node and check the slurm status (`sinfo`) or run some test jobs. 

Note that the minimal disk-size is 20 GB to accommodate the size of the VM. If you wan’t more than 20 GB, that’s okay.  

The above steps are explained in the document page: https://cloud.google.com/architecture/deploying-slurm-cluster-compute-engine


