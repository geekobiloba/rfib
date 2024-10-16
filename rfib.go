//
// Recursive Fibonacci in Go
//

package main

import (
  "fmt"
  "time"
  "os"
  "strconv"
  "log"
)

func main() {
  var n int

  if len(os.Args) > 1 {
    m, err := strconv.Atoi(os.Args[1])

    if err != nil {
      log.Fatal(err)
    }
    n = m
  }

  t := time.Now()
  f := fib(n)
  d := (time.Since(t)).Seconds()

  fmt.Printf("Computed fib(%d) = %d recursively in %v seconds\n", n, f, d)
}

func fib(n int) int {
  var f int

  if n < 2 {
    f = n
  } else {
    f = fib(n-1) + fib(n-2)
  }

  return f
}

