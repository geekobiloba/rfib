#
# Recursive Fibonacci in Crystal
#
# Note: BigInt is very slow, and Int64 is sufficient for fib(50)
#

def fib(n) : Int64
  if n<2
    n.to_i64
  else
    fib(n-1) + fib(n-2)
  end
end

n = ARGV.size > 0 ? ARGV[0].to_i : 0
f = 0 # must be initialized before used

d = Time.measure do
  f = fib(n)
end

puts "Computed fib(#{n}) = #{f} recursively in #{d.to_f} seconds"

# vim: ft=crystal: syntax=ruby:

