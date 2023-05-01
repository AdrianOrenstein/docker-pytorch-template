#!/usr/bin/env bash

# Set the version string
VERSION="2.0.0-cuda11.7-cudnn8-python3.10.11-devell"

# Prompt the user to ask if they want to push the images to the Docker registry
read -p "Do you want to push the images to the Docker registry and overwrite 'latest' after building? (y/N): " answer

# Build the Docker image
docker build -t adrianorenstein/pytorch:$VERSION -f dockerfiles/Dockerfile .

# Tag the image with the 'latest' tag
docker tag adrianorenstein/pytorch:$VERSION adrianorenstein/pytorch:latest

if [[ $answer == "y" || $answer == "Y" ]]; then
    # Push the version-specific image to the Docker registry
    docker push adrianorenstein/pytorch:$VERSION

    # Push the 'latest' image to the Docker registry
    docker push adrianorenstein/pytorch:latest
else
    echo "Skipping push to Docker registry."
fi
