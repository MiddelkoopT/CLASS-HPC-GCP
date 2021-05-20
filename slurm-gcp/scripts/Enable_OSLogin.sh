#!/bin/sh

#
# Enable OSLogin on Cluster
#
# https://github.com/GoogleCloudPlatform/guest-oslogin#overview
#
# Permissions needed to allow users to login to slurm cluster
#
#  compute.instances.get
#  compute.instances.osLogin
#  compute.projects.get
#  iam.serviceAccounts.actAs
#  iam.serviceAccounts.get
#  iam.serviceAccounts.list
#  resourcemanager.projects.get
#  resourcemanager.projects.list
#
#  Easy way is to use predefined roles:
#
#  Service Account User
#  Compute OS Login
#


yum -y install make gcc-c++ libcurl-devel json-c json-c-devel pam-devel policycoreutils-python
yum -y install rpmdevtools
