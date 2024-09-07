#!/bin/bash

# Pull the Docker image
docker pull --platform "linux/amd64" docker.io/adrianorenstein/atari_pytorch:latest

# Run the container and execute atari.py
docker run --rm -it \
  -v $(pwd):/app \
  -w /app \
  --platform "linux/amd64" \
  docker.io/adrianorenstein/atari_pytorch:latest \
  python dockerfiles/atari/atari.py
