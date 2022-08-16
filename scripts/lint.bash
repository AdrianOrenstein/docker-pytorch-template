#!/usr/bin/env bash

desired_command=' \
    black src/ && \
    isort src/ --settings-file=linters/isort.ini && \
    flake8 src/ --config=linters/flake8.ini \
'

if [ "$DOCKER_RUNNING" == true ] 
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
        imagename \
        /bin/bash -c "${desired_command}"
fi