Bootstrap: docker
From: nvidia/cuda:11.4.2-devel-ubuntu20.04


%environment
  export DEBIAN_FRONTEND=noninteractive
  export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/.mujoco/mujoco210/bin
  export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/nvidia/lib64
  export MUJOCO_PY_MUJOCO_PATH=/opt/.mujoco/mujoco210

%post
  apt-get update
  apt-get install -y \
    python3 \
    python3-pip \
    wget \
    git \
    patchelf \
    libosmesa6-dev

  mkdir -p /opt/.mujoco &&\
  wget https://mujoco.org/download/mujoco210-linux-x86_64.tar.gz -O mujoco.tar.gz &&\
  tar -xf mujoco.tar.gz -C /opt/.mujoco &&\
  rm mujoco.tar.gz

  pip install "mujoco-py<2.2,>=2.1" &&\
  python3 -c "import mujoco_py" &&\
  chmod -R 777 /usr/local/lib/python3.8/dist-packages/mujoco_py

  pip install \
  torch \
  numpy \
  matplotlib \
  wandb[media] \
  git+https://github.com/openai/gym.git