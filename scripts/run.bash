#!/bin/bash

# Install yq if it's not already installed
if ! command -v yq &> /dev/null
then
    echo "yq could not be found, goto https://github.com/mikefarah/yq#install"

    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        echo probably run "brew install yq"
    fi

    exit 1
fi

# Parse the values from the config.yaml file
USERNAME=$(yq e '.common.USERNAME' config.yaml)
IMAGE_NAME=$(yq e '.images.pytorch.IMAGE_NAME' config.yaml)
TAG=$(yq e '.images.pytorch.TAG' config.yaml)

FULL_IMAGE_NAME="$USERNAME/$IMAGE_NAME:$TAG"

# Check if Docker is running
if [ "$DOCKER_RUNNING" == true ]
then
    echo "Already inside docker instance, I don't know why you'd want to nest terminals?"
else
    echo "Starting up docker instance..."

    # Set volumes
    cmp_volumes="--volume=$(pwd):/app/:rw"

    # Check OS type
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        docker run --rm -it \
            $cmp_volumes \
            --ipc host \
            -w /app \
            $FULL_IMAGE_NAME \
            /bin/bash
    else
        # Other OS (assuming Linux)
        docker run --rm -it \
            $cmp_volumes \
            --gpus all \
            --ipc host \
            -w /app \
            $FULL_IMAGE_NAME \
            /bin/bash
    fi
fi
