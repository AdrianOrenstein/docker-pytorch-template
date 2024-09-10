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

# Specify the image type (pytorch, minigrid, or atari) as a script argument
IMAGE_TYPE=$1

# Parse the values from the combined config.yaml file
USERNAME=$(yq e '.common.USERNAME' config.yaml)
IMAGE_NAME=$(yq e ".images.$IMAGE_TYPE.IMAGE_NAME" config.yaml)
TAG=$(yq e ".images.$IMAGE_TYPE.TAG" config.yaml)
DOCKERFILE_LOCATION=$(yq e ".images.$IMAGE_TYPE.DOCKERFILE_LOCATION" config.yaml)

FULL_IMAGE_NAME="$USERNAME/$IMAGE_NAME:$TAG"
echo "Building image $FULL_IMAGE_NAME"

# make sure buildx is installed, and alias "docker build" to "docker buildx"
docker buildx install 

PLATFORMS=$(yq e ".images.$IMAGE_TYPE.PLATFORMS" config.yaml)
echo "Building for platforms: $PLATFORMS"

# Build image for multiple platforms
docker buildx build -t $FULL_IMAGE_NAME \
    --platform="$PLATFORMS" \
    -f ${DOCKERFILE_LOCATION}/Dockerfile . \
    --push

# after this you should see the image with "docker image ls" 
echo loading $FULL_IMAGE_NAME into docker image registry
docker build \
    -t $FULL_IMAGE_NAME \
    -f ${DOCKERFILE_LOCATION}/Dockerfile . \
    --load

PYTHON_VERSION=$(docker run --rm $FULL_IMAGE_NAME python -c 'import sys; print(".".join(map(str, sys.version_info[:3])), end="")')
TORCH_VERSION=$(docker run --rm $FULL_IMAGE_NAME python -c 'import torch; print(torch.__version__, end="")')
NEW_TAG="${TORCH_VERSION//+/_}-python${PYTHON_VERSION}-devell"
FULL_IMAGE_WITH_VERSIONS="$USERNAME/$IMAGE_NAME:$NEW_TAG"

# build image for multiple platforms, push latest to docker.io
docker build -t $FULL_IMAGE_WITH_VERSIONS \
    --platform="$PLATFORMS" \
    -f ${DOCKERFILE_LOCATION}/Dockerfile . \
    --push

# you should see the pytorch and python tagged image with "docker image ls"
docker build -t $FULL_IMAGE_WITH_VERSIONS \
    -f ${DOCKERFILE_LOCATION}/Dockerfile . \
    --load
