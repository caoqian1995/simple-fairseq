#!/bin/bash

if [ $# != 2 ];then
	echo "usage: $0 dev_file ref_file"
	exit
fi

DEV_FILE=$1
REF_FILE=$2
CHECKPOINT_DIR=./output
BLEU_LOG=${CHECKPOINT_DIR}/bleu.log
SRC_DICO_FILE=./data/vocab.cn
TGT_DICO_FILE=./data/vocab.en

for i in {0..34}
do
  echo ${i} >> ${BLEU_LOG}
  CUDA_VISIBLE_DEVICES=3 \
	python translate.py --translate_file ${DEV_FILE} \
		                --seed 1234 \
						--src_dico_file ${SRC_DICO_FILE} \
						--tgt_dico_file ${TGT_DICO_FILE} \
						--checkpoint_dir ${CHECKPOINT_DIR} \
						--id ${i} \
                        --gpu_num 1 
  #bash run_translate.sh ${i}
  perl script/multi-bleu.perl -lc ${REF_FILE} < output/predict_${i}.en | grep "BLEU =" >> ${BLEU_LOG}
done


best_model_id=`cat ${BLEU_LOG} | python script/get_best_model.py`
echo "best model id:" >> ${BLEU_LOG}
echo ${best_model_id} >> ${BLEU_LOG}
cp ${CHECKPOINT_DIR}/model_epoch${best_model_id}.pt ${CHECKPOINT_DIR}/model_best.pt
