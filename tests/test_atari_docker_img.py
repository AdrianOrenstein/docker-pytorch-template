import subprocess
import pytest

def test_docker_image_pull():
    """Test if the Docker image can be pulled successfully."""
    result = subprocess.run(
        ["docker", "pull", "--platform", "linux/amd64", 
         "docker.io/adrianorenstein/atari_pytorch:latest"], 
        stdout=subprocess.PIPE, stderr=subprocess.PIPE
    )
    assert result.returncode == 0, f"Docker pull failed: {result.stderr.decode()}"

def test_run_atari_script():
    """Test if the Atari script runs successfully inside the Docker container."""
    result = subprocess.run(
        [
            "docker", "run", "--rm", "-it",
            "-v", "$(pwd):/app",
            "-w", "/app",
            "--platform", "linux/amd64",
            "docker.io/adrianorenstein/atari_pytorch:latest",
            "python", "dockerfiles/atari/atari.py"
        ], 
        stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True
    )
    assert result.returncode == 0, f"Running atari.py failed: {result.stderr.decode()}"

if __name__ == "__main__":
    pytest.main()