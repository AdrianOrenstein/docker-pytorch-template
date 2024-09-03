# Use a base image with apt package manager
FROM python:3.12.5

ARG DEBIAN_FRONTEND=noninteractive
ENV DOCKER_RUNNING=true
ENV APPTAINER_RUNNING=true

RUN apt-get update

RUN pip install \
    torch einops \
    numpy pandas matplotlib seaborn scikit-learn tqdm loguru jupyterlab ipywidgets \
    flake8-black flake8 isort \
    pytest pytest-benchmark pytest-parallel py coverage

RUN pip install --user --no-cache-dir redis wandb moviepy imageio pysocks 'requests[socks]'
# wandb login --relogin "APIKEYHERE"

CMD [ "/bin/bash" ]