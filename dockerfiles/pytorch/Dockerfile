# Use a base image with apt package manager
FROM python:3.11.9

ARG DEBIAN_FRONTEND=noninteractive
ENV DOCKER_RUNNING=true
ENV APPTAINER_RUNNING=true

RUN apt-get update && \
    apt-get install rpm2cpio cpio -y && \
    curl -s https://raw.githubusercontent.com/apptainer/apptainer/main/tools/install-unprivileged.sh | \
    bash -s - install-dir && \
    wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && \
    chmod +x /usr/bin/yq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install \
    torch einops \
    numpy pandas matplotlib seaborn scikit-learn tqdm loguru jupyterlab ipywidgets \
    flake8-black flake8 isort \
    pytest pytest-benchmark pytest-parallel py coverage \
    redis wandb moviepy imageio pysocks 'requests[socks]' 

# wandb login --relogin "APIKEYHERE"

CMD [ "/bin/bash" ]