#!/bin/bash
# cd best-car-dealers/server/database
# Download and Give it execute permission: chmod +x setup_docker_script.sh
# ./setup_docker_script.sh

# Exit script on error
set -e

# Build Docker app
docker build . -t nodeapp

# Run the server
docker-compose up

echo "Building complete!"
