#   Trivial recursive Fibonacci benchmark

Using a few languages/compilers/interpreters I play with—not necessarily
my favourites, though.

Run `make` for the default `fib(40)`,
or `make N=45`, or even `make N=50` to see them crying,

```text
rfib_codon     : Computed fib(50) = 12586269025 recursively in 36.4295 seconds
rfib_c         : Computed fib(50) = 12586269025 recursively in 39.291117 seconds
rfib_crystal   : Computed fib(50) = 12586269025 recursively in 44.147242417 seconds
rfib_go        : Computed fib(50) = 12586269025 recursively in 49.2525185 seconds
rfib.jl        : Computed fib(50) = 12586269025 recursively in 49.573153 seconds
rfib-chez.scm  : Computed fib(50) = 12586269025 recursively in 68.317456 seconds
rfib_gerbil    : Computed fib(50) = 12586269025 recursively in 72.8179349899292 seconds
rfib.rkt       : Computed fib(50) = 12586269025 recursively in 75.96952099609375 seconds
rfib.luajit    : Computed fib(50) = 12586269025 recursively in 101.783914 seconds
rfib.pypy      : Computed fib(50) = 12586269025 recursively in 113.09507513046265 seconds
rfib_gambit    : Computed fib(50) = 12586269025 recursively in 147.76602005958557 seconds
rfib_sbcl      : Computed fib(50) = 12586269025 recursively in 351.50543 seconds
rfib_chicken   : Computed fib(50) = 12586269025 recursively in 898.967 seconds
rfib.py        : Computed fib(50) = 12586269025 recursively in 1453.3824651241302 seconds
```
