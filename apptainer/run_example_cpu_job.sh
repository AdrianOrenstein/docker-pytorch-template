# salloc --time=0:10:0 --mem-per-cpu=4G --ntasks=4 --account=def-mbowling

IMAGE_NAME=${1:-minigrid_pytorch_2.4.0-python3.12.5-devell.sif}

# Load apptainer and copy over the container
module load apptainer/1.2.4
cp ~/projects/def-mbowling/aorenste/apptainer_images/$IMAGE_NAME $SLURM_TMPDIR/
cd $SLURM_TMPDIR/

# Set up SOCKS5 proxy
echo "Setting up SOCKS5 proxy..."
ssh -q -N -T -f -D 8888 `echo $SSH_CONNECTION | cut -d " " -f 3`
export ALL_PROXY=socks5h://localhost:8888

# clone an example repo
git config --global http.proxy $ALL_PROXY
git clone --quiet https://github.com/AdrianOrenstein/async-mdp.git $SLURM_TMPDIR/project

# sanity check
apptainer run \
    --env ALL_PROXY=$ALL_PROXY \
    --env APPEND_PATH=$SLURM_TMPDIR/project \
    $SLURM_TMPDIR/$IMAGE_NAME python -c "import torch, minigrid; print(f'{torch.__version__=}\t{minigrid.__version__=}')"

apptainer run \
    --env ALL_PROXY=$ALL_PROXY \
    --env APPEND_PATH=$SLURM_TMPDIR/project \
    $SLURM_TMPDIR/$IMAGE_NAME python -c "import torch; a=torch.ones(50); out=(a+a)*2; print(out.shape, out)"

apptainer run \
    --env ALL_PROXY=$ALL_PROXY \
    --env APPEND_PATH=$SLURM_TMPDIR/project \
    $SLURM_TMPDIR/$IMAGE_NAME python $SLURM_TMPDIR/project/src/minigrid_experiments/maze.py
