#!/usr/bin/env python
# -*- coding:utf-8 -*-

import sys

d = {}
for s in sys.stdin:
    for w in s.split():
        d[w] = d.get(w,0) + 1

for k,v in sorted(d.items(), key=lambda d:d[1], reverse=True):
    out = str(k) + " " + str(v)
    print(out)
