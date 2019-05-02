#!/bin/bash

if [ $# != 2 ];then
	echo "usage: $0 train_file checkpoint_dir(output model dir)"
	exit
fi

TRAIN_FILE=$1
CHECKPOINT_DIR=$2

CUDA_VISIBLE_DEVICES=1 \
	nohup python train.py --train_data ${TRAIN_FILE} \
						  --max_len 100 \
						  --batch_size_tokens 4096 \
						  --update_freq 8 \
						  --checkpoint_dir ${CHECKPOINT_DIR} \
						  --seed 1234 \
						  --gpu_num 1 > log.train &
