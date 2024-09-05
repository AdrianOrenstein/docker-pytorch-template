# Use a base image with apt package manager
FROM python:3.12.5

ARG DEBIAN_FRONTEND=noninteractive
ENV DOCKER_RUNNING=true
ENV APPTAINER_RUNNING=true

RUN apt-get update && \
    apt-get install rpm2cpio cpio -y && \
    curl -s https://raw.githubusercontent.com/apptainer/apptainer/main/tools/install-unprivileged.sh | \
    bash -s - install-dir

RUN pip install \
    torch einops \
    numpy pandas matplotlib seaborn scikit-learn tqdm loguru jupyterlab ipywidgets \
    flake8-black flake8 isort \
    pytest pytest-benchmark pytest-parallel py coverage

RUN pip install redis wandb moviepy imageio pysocks 'requests[socks]'
# wandb login --relogin "APIKEYHERE"

CMD [ "/bin/bash" ]