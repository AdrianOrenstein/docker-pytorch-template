# Docker project template

`docker pull adrianorenstein/pytorch:latest` pulls the latest pytorch image i've made

`make run <img_type>` launches imagename in config.yaml, try: `apptainer`, `pytorch`, `minigrid`, `atari`

`make jupyter` launches jupyter-lab

## Build apptainer images from dockerhub images
`make run apptainer apptainer pull docker://adrianorenstein/pytorch:latest`

# TODO
- [ ] Make a bash script to pull a dockerhub image, pip freeze, and build the wheels using [build_wheel.sh](https://github.com/ComputeCanada/wheels_builder?tab=readme-ov-file#build_wheelsh). Then, build a sif with these wheels.