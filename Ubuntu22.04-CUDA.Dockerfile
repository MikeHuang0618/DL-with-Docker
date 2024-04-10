# 使用NVIDIA CUDA 12.3.2、cuDNN 9 基於 Ubuntu 22.04 的 Image
FROM nvidia/cuda:12.3.2-cudnn9-runtime-ubuntu22.04

# 安裝 python3 跟 pip3
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# 升級 pip 到最新版
RUN pip3 install --upgrade pip

# 安裝 requirements.txt
COPY ./requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt --extra-index-url https://download.pytorch.org/whl/cu117

# 設定工作路徑
WORKDIR /workspace
