#!/bin/bash

# Update and upgrade system
sudo apt update && sudo apt upgrade -y

# Install Curl
sudo apt install curl -y

# Download Docker
curl -fsSL https://get.docker.com -o get-docker.sh

# Run Docker shell script
sudo sh get-docker.sh

# Change directory to /var/lib
cd /var/lib

# Create a new directory for storage
sudo mkdir node_bevm_test_storage

# Fetch the Docker image for BEVM
sudo docker pull btclayer2/bevm:v0.1.1

# Prompt user to replace 'your_node_name' with their actual Metamask address
read -p "Enter your Metamask address (your_node_name): " metamask_address

# Run the Docker container with the provided Metamask address
sudo docker run -d -v /var/lib/node_bevm_test_storage:/root/.local/share/bevm btclayer2/bevm:v0.1.1 bevm "--chain=testnet" "--name=$metamask_address" "--pruning=archive" --telemetry-url "wss://telemetry.bevm.io/submit 0"

echo "BEVM setup completed. Please check the logs to ensure everything started successfully."
