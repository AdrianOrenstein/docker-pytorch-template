#!/usr/bin/env bash

# Define variables
USERNAME="adrianorenstein"
IMAGE_NAME="pytorch"
TAG="latest"
FULL_IMAGE_NAME="$USERNAME/$IMAGE_NAME:$TAG"

# Check if Docker is running
if [ "$DOCKER_RUNNING" == true ]
then
    echo "Inside docker instance, I don't know why you'd want to nest terminals?"
    exit 1
else
    echo "Starting up docker instance..."

    # Set volumes
    cmp_volumes="--volume=$(pwd):/app/:rw"

    # Check OS type
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OS X
        docker run --rm -ti \
            $cmp_volumes \
            -it \
            --ipc host \
            $FULL_IMAGE_NAME \
            /bin/bash
    else
        # Other OS (assuming Linux)
        docker run --rm -ti \
            $cmp_volumes \
            -it \
            --gpus all \
            --ipc host \
            $FULL_IMAGE_NAME \
            /bin/bash
    fi
fi
