make build apptainer && \
# Pytorch
docker pull --platform linux/amd64 adrianorenstein/pytorch:latest && \
docker save -o pytorch_amd64.tar adrianorenstein/pytorch:latest && \
docker run --rm -it \
    --volume=$(pwd):/app/:rw \
    --platform linux/arm64 \
    -w /app/ \
    adrianorenstein/apptainer \
    apptainer build --force pytorch_amd64.sif docker-archive://pytorch_amd64.tar && \
# Atari
docker pull --platform linux/amd64 adrianorenstein/atari_pytorch:latest && \
docker save -o atari_pytorch_amd64.tar adrianorenstein/atari_pytorch:latest && \
docker run --rm -it \
    --volume=$(pwd):/app/:rw \
    --platform linux/arm64 \
    -w /app/ \
    adrianorenstein/apptainer \
    apptainer build --force atari_pytorch_amd64.sif docker-archive://atari_pytorch_amd64.tar && \
echo "All images converted to sif successfully"

scp ./pytorch_amd64.sif aorenste@beluga:/project/def-mbowling/aorenste/ &
scp ./atari_pytorch_amd64.sif aorenste@beluga:/project/def-mbowling/aorenste/ &
wait
echo "All images copied to beluga successfully"