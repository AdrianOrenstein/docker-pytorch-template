# Docker project template

`docker pull adrianorenstein/pytorch:latest` pulls the latest pytorch image i've made

`make run <img_type>` launches imagename in config.yaml, try: `apptainer`, `pytorch`, `minigrid`, `atari`

`make jupyter` launches jupyter-lab

## Build apptainer images from dockerhub images
`make run apptainer apptainer pull docker://adrianorenstein/pytorch:pytorch_2.4.0-python3.12.5-devell`

Move it to a CC cluster via `scp ./pytorch_2.4.0-python3.12.5-devell.sif <USER>@beluga.alliancecan.ca:/project/<GROUP>/<USER>/`, for more info [go here](https://docs.alliancecan.ca/mediawiki/index.php?title=Transferring_data).

# TODO
- [ ] Make a bash script to pull a dockerhub image, pip freeze, and build the wheels using [build_wheel.sh](https://github.com/ComputeCanada/wheels_builder?tab=readme-ov-file#build_wheelsh). Then, build a sif with these wheels.