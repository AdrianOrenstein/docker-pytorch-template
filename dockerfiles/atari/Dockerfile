ARG PLATFORM
ARG base_image=adrianorenstein/pytorch:latest
FROM --platform=${PLATFORM:-linux/amd64} ${base_image}


RUN pip install ale-py==0.8.1 \
    gymnasium[atari] gymnasium[accept-rom-license] \
    gymnasium==0.29.1  \
    opencv-python==4.8.1.78  \
    Shimmy==0.2.1  \
    swig==4.1.1  \
    MinAtar==1.0.15

CMD [ "/bin/bash" ]

