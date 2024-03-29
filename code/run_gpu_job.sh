#!/bin/bash

OUTPUT_DIR="/home/xuranzeng/thesis_git/code/slurm_output"
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir "$OUTPUT_DIR"
fi

srun --account=pi-graziul \
     --job-name="train-ser" \
     --output="$OUTPUT_DIR/job_4.stdout" \
     --error="$OUTPUT_DIR/job_4.stderr" \
     --partition=gpu \
     --nodes=1 \
     --gpus=1 \
     --ntasks=1 \
     --gpus-per-task=1 \
     --mem-per-cpu=24G \
     --time=06:00:00 \
     python -u main.py