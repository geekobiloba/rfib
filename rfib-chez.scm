#!/usr/bin/env scheme-script
;;
;; Recursive Fibonacci in Chez Scheme
;;

(import (chezscheme))

(define (fib n)
  (if (< n 2)
    n
    (+ (fib (- n 1)) (fib (- n 2)))))

(define n
  (if (null? (command-line-arguments))
    0
    (string->number (car (command-line-arguments)))))

(define t0 (current-time))
(define f (fib n))
(define t1 (current-time))

(define d
  (let ((t (time-difference t1 t0)))
    (+ (time-second t)
       (/ (time-nanosecond t) 1e9))))

(printf "Computed fib(~A) = ~A recursively in ~F seconds~%" n f d)

