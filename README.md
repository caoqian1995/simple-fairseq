# 说明
2019 4.22
support run on a single gpu
multi-gpus hava bug now!

## Preprocess

```
./run_preprocess.sh ${src_path} ${tgt_path} ${src_vocab} ${tgt_vocab} ${output}
```

## Train

```
./run_train.sh ${train_file} ${checkpoint_dir}
```

## Eval for best model

```
nohup ./run_eval_on_dev_select_best_model.sh ${dev_file} ${ref_file} &
```

## Translate

```
./run_translate.sh ${test_file}
```
