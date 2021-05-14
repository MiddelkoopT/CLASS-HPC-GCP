#!/bin/bash

gcloud compute ssh class-controller -- kubectl apply -f - < keycloak.yaml
