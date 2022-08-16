#!/usr/bin/env bash

command='
    echo "Starting all benchmarks" &&
     pytest src/ -m \"benchmark\"
'

if [ "$DOCKER_RUNNING" == true ] 
then
    echo "Inside docker instance"
    /bin/bash -c "${command}"
    
else
    echo "Starting up docker instance..."

    cmp_volumes="--volume=$(pwd):/app/:rw"

    docker run --rm -ti \
        $cmp_volumes \
        -it \
        --gpus all \
        --ipc host \
        imagename \
        /bin/bash -c "${command}"
fi