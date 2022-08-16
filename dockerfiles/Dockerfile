FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-devel

ARG DEBIAN_FRONTEND=noninteractive
ENV DOCKER_RUNNING=true

RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    sudo \
    && rm -rf /var/lib/apt/lists/*

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
    numpy pandas matplotlib seaborn scikit-learn tqdm jupyterlab \
    einops flake8-black flake8 isort loguru pytest pytest-benchmark pytest-parallel coverage

# RUN git clone https://github.com/rusty1s/pytorch_scatter.git ~/pytorch_scatter && pip install --user --no-cache-dir -e ~/pytorch_scatter

# RUN pip3 install --user --no-cache-dir redis

# RUN pip3 install --user --no-cache-dir backpack-for-pytorch

# RUN pip3 install --user --no-cache-dir wandb
# RUN wandb login --relogin "APIKEYHERE"
# RUN pip3 install --user --no-cache-dir moviepy imageio

RUN pip3 install --user --no-cache-dir ipywidgets

# install self as module
COPY setup.py /app/setup.py
RUN pip3 install --user --no-cache-dir -e /app

CMD [ "/bin/bash" ]