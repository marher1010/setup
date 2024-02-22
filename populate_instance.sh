#!/bin/bash

# Define variables
LOCAL_DIR="/path/to/Web App"  # Path to your local directory
REMOTE_USERNAME="your_username"  # SSH username for the Google Cloud instance
REMOTE_IP="your_instance_ip"  # IP address of your Google Cloud instance
REMOTE_DIR="/path/to/destination"  # Path to the directory on the Google Cloud instance

# Copy files using SCP
scp -r "$LOCAL_DIR" "$REMOTE_USERNAME@$REMOTE_IP:$REMOTE_DIR"

# Check if SCP command was successful
if [ $? -eq 0 ]; then
    echo "Files copied successfully to Google Cloud instance."
else
    echo "Failed to copy files to Google Cloud instance."
fi
