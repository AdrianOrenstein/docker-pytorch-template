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
            -p 8888:8888 \
            $FULL_IMAGE_NAME \
            jupyter-lab --ip 0.0.0.0 --port 8888 --no-browser --allow-root
    else
        # Other OS (assuming Linux)
        docker run --rm -ti \
            $cmp_volumes \
            -it \
            --gpus all \
            --ipc host \
            -p 8888:8888 \
            $FULL_IMAGE_NAME \
            jupyter-lab --ip 0.0.0.0 --port 8888 --no-browser --allow-root
    fi
fi