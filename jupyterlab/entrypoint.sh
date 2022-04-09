#!/bin/bash

conda activate hoge
jupyter lab --allow-root --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.token=''
