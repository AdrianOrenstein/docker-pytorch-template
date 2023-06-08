# Use a base image with apt package manager
FROM python:3.10.11-bullseye

ARG DEBIAN_FRONTEND=noninteractive
ENV DOCKER_RUNNING=true

# Update package list and install Python 3
RUN apt-get update
RUN apt-get install sudo

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
    torch torchvision torchaudio lightning['extra'] torchmetrics \
    numpy pandas matplotlib seaborn scikit-learn tqdm jupyterlab ipywidgets \
    einops flake8-black flake8 isort loguru pytest pytest-benchmark pytest-parallel coverage

# RUN git clone https://github.com/rusty1s/pytorch_scatter.git ~/pytorch_scatter && pip install --user --no-cache-dir -e ~/pytorch_scatter

# RUN pip3 install --user --no-cache-dir redis backpack-for-pytorch wandb moviepy imageio \
#     && wandb login --relogin "APIKEYHERE"

# install self as module
COPY setup.py /app/setup.py
RUN pip3 install --user --no-cache-dir -e /app

CMD [ "/bin/bash" ]