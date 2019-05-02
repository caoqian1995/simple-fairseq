#!/usr/bin/env python
# -*- coding:utf-8 -*-

import sys

max_bleu = 0
max_id = 0
for i, line in enumerate(sys.stdin):
    if i%2 == 0:
        model_id = int(line.strip())
    else:
        line_bleu = float(line.strip().split()[2][:-1])
        if line_bleu > max_bleu:
            max_bleu = line_bleu
            max_id = model_id

print(max_id)
