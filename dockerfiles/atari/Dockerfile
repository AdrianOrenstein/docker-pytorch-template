ARG PLATFORM
ARG base_image=adrianorenstein/pytorch:latest
FROM --platform=${PLATFORM:-linux/amd64} ${base_image}

RUN pip install \
    gymnasium==0.29.1 \
    gymnasium[atari] \
    gymnasium[accept-rom-license] \
    MinAtar \
    opencv-python

CMD [ "/bin/bash" ]