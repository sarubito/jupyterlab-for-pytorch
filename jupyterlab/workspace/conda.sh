#!/bin/bash
conda activate torch
conda install pytorch torchvision numpy
conda install -c conda-forge jupyterlab
jupyter lab --allow-root --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.token='' --notebook-dir=/torch
