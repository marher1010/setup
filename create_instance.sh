#!/bin/bash

# Set variables
PROJECT_ID="your-project-id"
INSTANCE_NAME="your-instance-name"
MACHINE_TYPE="e2-medium"
ZONE="us-central1-a"
IMAGE_FAMILY="ubuntu-2004-lts"
IMAGE_PROJECT="ubuntu-os-cloud"
BOOT_DISK_TYPE="pd-standard"
BOOT_DISK_SIZE="20GB"
NETWORK="default"

# Create the virtual machine instance
gcloud compute instances create $INSTANCE_NAME \
    --project=$PROJECT_ID \
    --zone=$ZONE \
    --machine-type=$MACHINE_TYPE \
    --image-family=$IMAGE_FAMILY \
    --image-project=$IMAGE_PROJECT \
    --boot-disk-type=$BOOT_DISK_TYPE \
    --boot-disk-size=$BOOT_DISK_SIZE \
    --network=$NETWORK

# Output the external IP address of the instance
EXTERNAL_IP=$(gcloud compute instances describe $INSTANCE_NAME --zone=$ZONE --format='get(networkInterfaces[0].accessConfigs[0].natIP)')
echo "Instance created. External IP: $EXTERNAL_IP"
