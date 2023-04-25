#!/usr/bin/env bash

desired_command='
    coverage run --source=./src -m pytest src/ -m "not benchmark" &&
    coverage report -m
'

if [ "$DOCKER_RUNNING" == "true" ] 
then
    echo "Inside docker instance"

    /bin/bash -c "${desired_command}"
else
    echo "Starting up docker instance..."

    cmp_volumes="--volume=$(pwd):/app/:rw"
    docker run --rm -ti \
        $cmp_volumes \
        -it \
        --gpus all \
        --ipc host \
        adrianorenstein/pytorch:2.0.0-cuda11.7-cudnn8-devel \
        /bin/bash -c "${desired_command}"
fi