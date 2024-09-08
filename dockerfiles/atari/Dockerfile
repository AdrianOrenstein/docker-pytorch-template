ARG PLATFORM
ARG base_image=python:3.11.9
FROM --platform=${PLATFORM:-linux/amd64} ${base_image}

RUN pip install \
    ale-py==0.8.1 \
    AutoROM==0.4.2 \
    AutoROM.accept-rom-license==0.6.1 \
    certifi==2023.11.17 \
    charset-normalizer==3.3.2 \
    click==8.1.7 \
    cloudpickle==3.0.0 \
    common==0.1.2 \
    contourpy==1.2.0 \
    cycler==0.12.1 \
    Farama-Notifications==0.0.4 \
    filelock==3.13.1 \
    fonttools==4.47.0 \
    fsspec==2023.12.2 \
    gymnasium==0.29.1 \
    idna==3.6 \
    importlib-metadata==7.0.1 \
    importlib-resources==6.1.1 \
    Jinja2==3.1.2 \
    kiwisolver==1.4.5 \
    MarkupSafe==2.1.3 \
    matplotlib==3.8.2 \
    MinAtar==1.0.15 \
    mpmath==1.3.0 \
    networkx==3.2.1 \
    numpy==1.25.2 \
    opencv-python==4.8.1.78 \
    packaging==23.2 \
    pandas==2.1.0 \
    pfrl@git+https://github.com/prabhatnagarajan/pfrl@ewrl_experiments \
    Pillow==10.1.0 \
    pyparsing==3.1.1 \
    python-dateutil==2.8.2 \
    pytz==2023.3.post1 \
    requests==2.31.0 \
    scipy==1.11.2 \
    seaborn==0.13.0 \
    Shimmy==0.2.1 \
    six==1.16.0 \
    swig==4.1.1 \
    sympy==1.12 \
    torch==2.0.1 \
    tqdm==4.66.1 \
    typing_extensions==4.5.0 \
    tzdata==2023.3 \
    urllib3==2.1.0 \
    zipp==3.17.0 

CMD [ "/bin/bash" ]

