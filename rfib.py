#!/usr/bin/env python3
#
# Recursive Fibonacci in Python
#

import sys
from time import time

def fib(n):
    return n if n < 2 else fib(n-1) + fib(n-2)

n = int(sys.argv[1]) if len(sys.argv) > 1 else 0
t = time()
f = fib(n)
d = time() - t

print(f'Computed fib({n}) = {f} recursively in {d} seconds')

