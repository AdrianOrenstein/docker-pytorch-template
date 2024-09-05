ARG base_image=adrianorenstein/pytorch:latest
FROM ${base_image}

# install atari dependencies
RUN apt-get update && \
    apt-get install swig -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install 'gymnasium[atari, accept-rom-license]' autorom opencv-python && \
    AutoROM -y

CMD [ "/bin/bash" ]