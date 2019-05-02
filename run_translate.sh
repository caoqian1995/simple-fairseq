#!/bin/bash

if [ $# != 2 ];then
	echo "uasge: $0 test_file"
	exit
fi

TEST_FILE=$1
CHECKPOINT_DIR=./output
SRC_DICO_FILE=./data/vocab.cn
TGT_DICO_FILE=./data/vocab.en

CUDA_VISIBLE_DEVICES=3 \
	nohup python translate.py --translate_file ${TEST_FILE} \
                              --seed 1234 \
                              --src_dico_file ${SRC_DICO_FILE} \
                              --tgt_dico_file ${TGT_DICO_FILE} \
							  --checkpoint_dir ${CHECKPOINT_DIR} \
							  --best_model True \
                              --gpu_num 1 > log.translate &

