#!/bin/bash

# Path to the Terraform configuration directory
TF_DIR="/path/to/terraform/directory"

# Name of the specific .tf file you want to target
TARGET_FILE="$1"

# Get a list of all resources and modules in the target file
TARGETS=$(terraform state list -state="$TF_DIR/terraform.tfstate" | grep -E "^$TARGET_FILE:.*")

# Loop through each target and run terraform apply -target
for target in $TARGETS; do
  terraform plan -target="$target" "$TF_DIR"
done
