FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-devel

ARG DEBIAN_FRONTEND=noninteractive
ENV DOCKER_RUNNING=true

RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    curl \
    unzip \
    ca-certificates \
    libopenmpi-dev \
    sudo \
    bzip2 \
    libx11-6 \
    python3-dev \
    zlib1g-dev \
    libglib2.0-0 \
    x264 && \
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub && \
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/7fa2af80.pub && \
    rm -rf /var/lib/apt/lists/*

# Create a working directory
RUN mkdir /app
RUN chmod 777 /app
WORKDIR /app

# Create a non-root user and switch to it
RUN adduser --disabled-password --gecos '' --shell /bin/bash user && \
    chown -R user:user /app
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user

# All users can use /home/user as their home directory
ENV HOME=/home/user
RUN chmod 777 /home/user

ENV PATH="/root/.local/bin:${PATH}"
ENV PATH="/home/user/.local/bin:${PATH}"

RUN pip3 install --user --no-cache-dir \
    pytorch-lightning \
    numpy pandas matplotlib seaborn scikit-learn tqdm jupyterlab ipywidgets \
    einops flake8-black flake8 isort loguru pytest pytest-benchmark pytest-parallel coverage

# RUN git clone https://github.com/rusty1s/pytorch_scatter.git ~/pytorch_scatter && pip install --user --no-cache-dir -e ~/pytorch_scatter

# RUN pip3 install --user --no-cache-dir redis backpack-for-pytorch wandb moviepy imageio \
#     && wandb login --relogin "APIKEYHERE"

# install self as module
COPY setup.py /app/setup.py
RUN pip3 install --user --no-cache-dir -e /app

CMD [ "/bin/bash" ]