#!/bin/bash

CUDA_VISIBLE_DEVICES=1 \
	nohup python train.py --train_data data/train.bin \
						  --max_len 100 \
						  --batch_size_tokens 4000 \
						  --update_freq 8 \
						  --checkpoint_dir output \
						  --seed 1234 \
						  --gpu_num 1 > log.train &
