# Use a base image with apt package manager
FROM python:3.11.9
# TODO(3.10)

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
    absl-py>=0.9.0 \
    astunparse>=1.6.3 \
    cachetools>=4.1.1 \
    certifi>=2020.6.20 \
    chardet>=3.0.4 \
    cloudpickle>=1.3.0 \
    cycler>=0.10.0 \
    flax>=0.5.3 \
    future>=0.18.2 \
    gast>=0.3.3 \
    gin-config>=0.3.0 \
    google-auth>=1.19.2 \
    google-auth-oauthlib>=0.4.1 \
    google-pasta>=0.2.0 \
    grpcio>=1.30.0 \
    'gym[atari,accept-rom-license]<=0.25.2' \
    h5py>=2.10.0 \
    idna>=2.10 \
    jax>=0.3.16 \
    jaxlib>=0.3.15 \
    Keras-Preprocessing>=1.1.2 \
    kiwisolver>=1.2.0 \
    Markdown>=3.2.2 \
    matplotlib>=3.3.0 \
    msgpack>=1.0.0 \
    numpy>=1.18.5 \
    oauthlib>=3.1.0 \
    opencv-python>=4.3.0.36 \
    opt-einsum>=3.3.0 \
    pandas>=1.0.5 \
    Pillow>=7.2.0 \
    protobuf>=3.12.2 \
    pyasn1>=0.4.8 \
    pyasn1-modules>=0.2.8 \
    pygame>=1.9.6 \
    pyglet>=1.5.0 \
    pyparsing>=2.4.7 \
    python-dateutil>=2.8.1 \
    pytz>=2020.1 \
    requests>=2.24.0 \
    requests-oauthlib>=1.3.0 \
    rsa>=4.6 \
    scipy>=1.4.1 \
    six>=1.15.0 \
    setuptools>=49.2.01 \
    tensorboard \
    tensorboard-plugin-wit \
    tensorflow \
    tensorflow-estimator \
    tensorflow-probability>=0.13.0 \
    termcolor>=1.1.0 \
    tf-slim>=1.1.0 \
    urllib3>=1.25.10 \
    Werkzeug>=1.0.1 \
    wrapt>=1.12.1 \
    tqdm>=4.64.1

CMD [ "/bin/bash" ]