#!/usr/bin/env bash

desired_command='
    echo "Starting all non gpu related tests" &&
    pytest --workers 2 src/ -m "not benchmark and not gpu"
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