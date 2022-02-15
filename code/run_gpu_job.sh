#!/bin/bash

OUTPUT_DIR="/home/xuranzeng/TSFSER/slurm_output"
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir "$OUTPUT_DIR"
fi

srun --account=pi-graziul \
     --job-name="train-ser" \
     --output="$OUTPUT_DIR/job_1.stdout" \
     --error="$OUTPUT_DIR/job_1.stderr" \
     --partition=gpu \
     --nodes=1 \
     --gpus=1 \
     --ntasks=1 \
     --gpus-per-task=1 \
     --mem-per-cpu=24G \
     --time=02:00:00 \
     python -u main.py