FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:apptainer/ppa
RUN apt-get update
RUN apt-get install -y apptainer

CMD [ "/bin/bash" ]