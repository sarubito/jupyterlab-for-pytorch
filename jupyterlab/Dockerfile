FROM nvidia/cuda:11.4.1-cudnn8-devel-ubuntu20.04

ARG TZ=Asia/Tokyo

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ ${TZ}
# ENV NVIDIA_VISIBLE_DEVICES=all
# ENV NVIDIA_DRIVER_CAPABILITIES=all

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y --no-install-recommends \
    mesa-utils \
    x11-apps \
    git \
    vim \
    build-essential \
    curl \
    ca-certificates \
    wget \
    gnupg2 \
    lsb-release \ 
    mesa-utils \
    net-tools \
    iputils-ping \
    python3-pip \
    python3-tk \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    libglvnd-dev libglvnd-dev \
    libgl1-mesa-dev \
    libegl1-mesa-dev \
    libgles2-mesa-dev \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3.8 /usr/bin/python

RUN python3 -m pip install --upgrade pip \
    &&  python3 -m pip install --no-cache-dir \
    black \
    jupyterlab \
    jupyterlab_code_formatter \
    jupyterlab-git \
    lckr-jupyterlab-variableinspector \
    jupyterlab_widgets \
    ipywidgets \
    import-ipynb \
    jupyterlab_git

# RUN pip install --no-cache-dir \
#     numpy \
#     pandas \
#     scipy \
#     scikit-learn \
#     pycaret \
#     matplotlib \
#     japanize_matplotlib \
#     mlxtend \
#     seaborn \
#     plotly \
#     requests \
#     beautifulsoup4 \
#     Pillow \
#     opencv-python \
#     torch

# RUN pip install --no-cache-dir \
#     pydeps \
#     graphviz \
#     pandas_profiling \
#     shap \
#     umap \
#     xgboost \
#     lightgbm

RUN wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -O /root/anaconda.sh
RUN chmod +x /root/anaconda.sh
RUN bash /root/anaconda.sh -b

ENV PATH=/root/anaconda3/bin:${PATH}
RUN conda init bash
RUN conda install -c conda-forge jupyter_contrib_NbExtensions
RUN conda install -c conda-forge jupyterlab

WORKDIR /root/workspace
RUN conda create -n torch python=3.8
