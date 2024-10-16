/*
 * Recursive Fibocacci in D
 *
 */

import std.stdio;
import std.conv;
import std.datetime.stopwatch;

void main(string[] args) {
  int n = args.length > 1 ? to!int(args[1]) : 0;

  auto timer = StopWatch(AutoStart.no);
  timer.start();

  long f = fib(n);

  timer.stop();

  double d = timer.peek.total!"nsecs" / 1e9;

  writef("Computed fib(%d) = %d recursively in %f seconds\n", n, f, d);
} // main()

long fib(int n) {
  long f;

  if (n<2) {
    f = n;
  } else {
    f =  fib(n-1) + fib(n-2);
  }

  assert(f <= long.max, "f is too large");

  return f;
} // fib()

