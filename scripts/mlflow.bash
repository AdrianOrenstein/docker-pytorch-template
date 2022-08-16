#!/usr/bin/env bash

if [ "$DOCKER_RUNNING" == true ] 
then
    echo "Inside docker instance, needs to be outside of a docker to portforward 5000"
    exit 1
    
else
    echo "Starting up docker instance..."

    cmp_volumes="--volume=$(pwd):/app/:rw"

    docker run --rm -ti \
        $cmp_volumes \
        -it \
        -p 5000:5000 \
        --gpus all \
        --ipc host \
        imagename \
        /bin/bash -c "mlflow server --host 0.0.0.0 --port 5000"
fi