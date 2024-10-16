#!/usr/bin/env ruby
#
# Recursive Fibonacci in Ruby
#

def fib(n)
  if n<2
    n
  else
    fib(n-1) + fib(n-2)
  end
end

n  = ARGV.size > 0 ? ARGV[0].to_i : 0
t0 = Time.now()
f  = fib(n)
t1 = Time.now()
d  = t1 - t0

puts "Computed fib(#{n}) = #{f} recursively in #{d.to_f} seconds"
