#!/usr/bin/env julia
#
# Recursive Fibonacci in Julia
#

function fib(n)
  if n < 2
    return n
  else
    return fib(n-1) + fib(n-2)
  end
end

function timefib(n)
  t = time_ns()
  f = fib(n)
  d = (time_ns() - t) / 1e9

  println("Computed fib($(n)) = $(f) recursively in $(d) seconds")
end

if !(isinteractive())
  n = length(ARGS) > 0 ? parse(Int, ARGS[1]) : 0

  timefib(n)
end

