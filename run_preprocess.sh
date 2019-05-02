#!/bin/bash

#DATA_FOLDER=./data
#src_path=${DATA_FOLDER}/train.cn.bpe
#tgt_path=${DATA_FOLDER}/train.en.bpe
#src_vocab=${DATA_FOLDER}/dict.cn.txt
#tgt_vocab=${DATA_FOLDER}/dict.en.txt
#data_output=${DATA_FOLDER}/train.bin

if [ $# != 5 ];then
	echo "usage: $0 src_path tgt_path src_vocab tgt_vocab output"
	exit
fi

src_path=$1
tgt_path=$2
src_vocab=$3
tgt_vocab=$4
data_output=$5

#Build vocab
cat ${src_path} | python script/build-vocab.py > ${src_vocab}
cat ${tgt_path} | python script/build-vocab.py > ${tgt_vocab}

#preprocess
python preprocess.py --src_path ${src_path} \
					 --tgt_path ${tgt_path} \
					 --src_vocab ${src_vocab} \
					 --tgt_vocab ${tgt_vocab} \
					 --data_output ${data_output}
