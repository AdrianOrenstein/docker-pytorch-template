#!/bin/bash

USERNAME="adrianorenstein"
IMAGE_NAME="pytorch"
TEMP_TAG="latest"
FULL_IMAGE_NAME="$USERNAME/$IMAGE_NAME:$TEMP_TAG"

# Build the image with a temporary tag
docker buildx build \
    --platform "linux/arm64/v8,linux/amd64" \
    -t $FULL_IMAGE_NAME \
    -f dockerfiles/Dockerfile . \
    --push

# Start a Docker container and get Python and PyTorch versions
PYTHON_VERSION=$(docker run --rm -ti $FULL_IMAGE_NAME python -c 'import sys; print(".".join(map(str, sys.version_info[:3])))' | tr -d '\r')
TORCH_VERSION=$(docker run --rm -ti $FULL_IMAGE_NAME python -c 'import torch; print(torch.__version__)' | tr -d '\r')

# Construct new tag
NEW_TAG="${TORCH_VERSION}-python${PYTHON_VERSION}-devell"
FULL_IMAGE_NAME="$USERNAME/$IMAGE_NAME:$NEW_TAG"

docker buildx build \
    --platform "linux/arm64/v8,linux/amd64" \
    -t $FULL_IMAGE_NAME \
    -f dockerfiles/Dockerfile . \
    --push
