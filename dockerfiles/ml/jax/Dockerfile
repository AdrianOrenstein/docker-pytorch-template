# Use a base image with apt package manager
FROM python:3.11.9

ARG DEBIAN_FRONTEND=noninteractive
ENV DOCKER_RUNNING=true
ENV APPTAINER_RUNNING=true

# RUN apt-get update && \
#     apt-get install rpm2cpio cpio -y && \
#     curl -s https://raw.githubusercontent.com/apptainer/apptainer/main/tools/install-unprivileged.sh | \
#     bash -s - install-dir && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

# RUN pip install \
#     jax \
#     numpy pandas matplotlib seaborn scikit-learn tqdm loguru jupyterlab ipywidgets \
#     flake8-black flake8 isort \
#     pytest pytest-benchmark pytest-parallel py coverage \
#     redis wandb moviepy imageio pysocks 'requests[socks]'

RUN pip install \
    tensorflow>=2.2.0 \
    gin-config>=0.3.0 \
    absl-py>=0.9.0 \
    flax>=0.2.0 \
    jax>=0.1.72 \
    jaxlib>=0.1.51 \
    Pillow>=7.0.0 \
    numpy>=1.16.4 \
    pygame>=1.9.2 \
    pandas>=0.24.2 \
    tf_slim>=1.0 \
    tensorflow-probability>=0.13.0 \
    tqdm>=4.64.1

CMD [ "/bin/bash" ]