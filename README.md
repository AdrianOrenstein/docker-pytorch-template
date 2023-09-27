# Docker project template for Apple M1 and Cuda

`docker pull adrianorenstein/pytorch:latest` pulls the latest pytorch image i've made

`make run` launches imagename in config.yaml

`make jupyter` launches jupyter-lab 

## How to setup
1. Use this repo as a template

1. In `config.yaml` change imagename to a new name, or ideally, your image name hosted on dockerhub

1. Change the setup.py file project name so something of your own

1. Edit `dockerfiles/Dockerfile` to your preference, i.e.:

```Dockerfile
FROM adrianorenstein/pytorch:latest

# Project specific dependancies 
RUN pip3 install --user --no-cache-dir \
    gymnasium[classic-control] \ 
    swig gymnasium[box2d] 

# install self as module
COPY setup.py /app/setup.py
RUN pip3 install --user --no-cache-dir -e /app

CMD [ "/bin/bash" ]
```

1. `make build` builds Dockerfile as an image, **ensure you have buildx installed for multi-platform builds** AND **changed the config username to your own**


# FAQs

## How do I install NVIDIA-CUDA drivers for my host machine?
Go [here](https://www.nvidia.com/download/index.aspx).

## How can I store my container so others don't need to build it again?
Go to [dockerhub](https://hub.docker.com/). This is useful so that others do not need to rebuild the container again with different versions.


