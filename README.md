# Docker project template

`make build pytorch && make build atari && pytest tests/test_atari_docker_img.py tests/test_pytorch_docker_img.py && echo "done"`

`docker pull adrianorenstein/pytorch:latest` pulls the latest pytorch image i've made

`make run <img_type>` launches imagename in config.yaml, try: `apptainer`, `pytorch`, `minigrid`, `atari`

`make jupyter` launches jupyter-lab

## Build apptainer images from dockerhub images
`make run apptainer apptainer pull docker://adrianorenstein/pytorch:pytorch_2.4.0-python3.12.5-devell`

Move it to a CC cluster via `scp ./pytorch_2.4.0-python3.12.5-devell.sif <USER>@beluga.alliancecan.ca:/project/<GROUP>/<USER>/`, for more info [go here](https://docs.alliancecan.ca/mediawiki/index.php?title=Transferring_data).

# TODO
- [ ] Make a bash script to pull a dockerhub image, pip freeze, and build the wheels using [build_wheel.sh](https://github.com/ComputeCanada/wheels_builder?tab=readme-ov-file#build_wheelsh). Then, build a sif with these wheels.


# Other architectures?
https://github.com/docker-library/official-images#architectures-other-than-amd64


# didn't work
docker pull improbableailab/dopamine_atari:latest && \
docker save -o dopamine_jax_amd64.tar improbableailab/dopamine_atari:latest && \
    make run apptainer apptainer build dopamine_jax_amd64.sif docker-archive://dopamine_jax_amd64.tar

# maybe?
docker pull massaudev/dopamine:latest && \
docker save -o dopamine_jax_amd64_massaudev.tar massaudev/dopamine:latest && \   
    make run apptainer apptainer build dopamine_jax_amd64_massaudev.sif docker-archive://dopamine_jax_amd64_massaudev.tar


# SIF
converting into apptainer sifs
```bash

apptainer pull docker://adrianorenstein/atari_pytorch:latest
# apptainer run ./converted_on_cluster_atari_pytorch_latest.sif python apptainer_images/benchmark_mmul.py
# Average time: 3.882581 seconds
# Standard deviation: 0.039912 seconds

echo "building sif files"
make build apptainer && \
    docker pull --platform linux/amd64 adrianorenstein/pytorch:latest && \
    docker save -o pytorch_amd64.tar adrianorenstein/pytorch:latest && \
    make run apptainer apptainer build pytorch_amd64.sif docker-archive://pytorch_amd64.tar
# apptainer run ./pytorch_amd64.sif python apptainer_images/benchmark_mmul.py
# Average time: 3.886498 seconds
# Standard deviation: 0.018760 seconds

apptainer run ./atari_pytorch_amd64.sif python apptainer_images/benchmark_mmul.py
# Average time: 3.889686 seconds
# Standard deviation: 0.046351 seconds
apptainer run ./pytorch_amd64.sif python apptainer_images/benchmark_mmul.py
# Average time: 3.882812 seconds
# Standard deviation: 0.008093 seconds

```
