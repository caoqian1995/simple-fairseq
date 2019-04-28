#!/bin/bash

if [ $# != 1 ];then
	echo "uasge: $0 id"
	exit
fi

id=$1

CUDA_VISIBLE_DEVICES=1 \
	nohup python translate.py --translate_file data/nist06.cn \
                              --seed 1234 \
                              --src_dico_file data/dict.cn.txt \
                              --tgt_dico_file data/dict.en.txt \
							  --checkpoint_dir output \
							  --id ${id}
                              --gpu_num 1 > log.translate &

