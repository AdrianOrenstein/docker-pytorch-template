import subprocess
import pytest

def run_apptainer_command(image_name, command, env_vars=None):
    """Helper function to run apptainer command with given image and command."""
    cmd = ['apptainer', 'run', image_name] + command
    env = env_vars if env_vars else {}
    result = subprocess.run(cmd, capture_output=True, text=True, env=env)
    return result.stdout, result.stderr, result.returncode

def is_apptainer_installed():
    """Check if apptainer is installed."""
    try:
        subprocess.run(['apptainer', '--version'], capture_output=True, check=True)
        return True
    except (subprocess.CalledProcessError, FileNotFoundError):
        return False

@pytest.mark.skipif(not is_apptainer_installed(), reason="Apptainer is not installed")
def test_torch_and_minigrid_versions():
    """Test that torch and minigrid versions can be retrieved."""
    command = ['python', '-c', "import torch, minigrid; print(f'{torch.__version__=}\t{minigrid.__version__=}')"]
    stdout, stderr, returncode = run_apptainer_command("$SLURM_TMPDIR/$IMAGE_NAME", command, {'ALL_PROXY': 'socks5h://localhost:8888'})
    assert returncode == 0, f"Command failed with stderr: {stderr}"
    assert 'torch.__version__=' in stdout, "Torch version not found in output."
    assert 'minigrid.__version__=' in stdout, "Minigrid version not found in output."

@pytest.mark.skipif(not is_apptainer_installed(), reason="Apptainer is not installed")
def test_torch_cpu_operations():
    """Test that torch operations on CPU work correctly."""
    command = ['python', '-c', "import torch; a=torch.ones(50).cpu(); out=(a+a)*2; print(out.shape, out)"]
    stdout, stderr, returncode = run_apptainer_command("$SLURM_TMPDIR/$IMAGE_NAME", command, {'ALL_PROXY': 'socks5h://localhost:8888'})
    assert returncode == 0, f"Command failed with stderr: {stderr}"
    assert '(50,)' in stdout, "Torch CPU operation did not produce expected output."

@pytest.mark.skipif(not is_apptainer_installed(), reason="Apptainer is not installed")
def test_python_module_in_repo():
    """Test that a Python module from the cloned repo can be run."""
    command = ['python', '-m', 'black', '$SLURM_TMPDIR/project']
    stdout, stderr, returncode = run_apptainer_command("$SLURM_TMPDIR/$IMAGE_NAME", command, {'ALL_PROXY': 'socks5h://localhost:8888'})
    assert returncode == 0, f"Command failed with stderr: {stderr}"
    assert 'reformatted' in stdout or 'unchanged' in stdout, "Black did not run as expected on the project."