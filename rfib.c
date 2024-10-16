/*
 * Recursive Fibonacci in C
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

long int fib(int n) {
  if (n < 2) {
    return n;
  } else {
    return fib(n-1) + fib(n-2);
  }
}

int main(int argc, char** argv) {
  int n = argc > 1 ? atoi(argv[1]) : 0;

  struct timespec t0, t1;
  long int    f;
  long double d;

  clock_gettime(CLOCK_MONOTONIC_RAW, &t0);
  f = fib(n);
  clock_gettime(CLOCK_MONOTONIC_RAW, &t1);

  d = (t1.tv_sec  - t0.tv_sec) + (t1.tv_nsec - t0.tv_nsec) / 1000000000.0;

  printf("Computed fib(%d) = %ld recursively in %Lf seconds\n", n, f, d);
}

