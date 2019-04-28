#!/bin/bash

DATA_FOLDER=./data

src_path=${DATA_FOLDER}/train.cn.bpe
tgt_path=${DATA_FOLDER}/train.en.bpe
src_vocab=${DATA_FOLDER}/dict.cn.txt
tgt_vocab=${DATA_FOLDER}/dict.en.txt
data_output=${DATA_FOLDER}/train.bin

#Build vocab
cat ${src_path} | python script/build-vocab.py > ${src_vocab}
cat ${tgt_path} | python script/build-vocab.py > ${tgt_vocab}

#preprocess
python preprocess.py --src_path ${src_path} \
					 --tgt_path ${tgt_path} \
					 --src_vocab ${src_vocab} \
					 --tgt_vocab ${tgt_vocab} \
					 --data_output ${data_output}
