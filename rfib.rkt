#!/usr/bin/env racket
#lang racket/base
;;
;; Recursive Fibonacci in Racket Scheme
;;

(define (fib n)
  (if (< n 2)
    n
    (+ (fib (- n 1)) (fib (- n 2)))))

(define n
  (if (equal? (vector-length (current-command-line-arguments)) 0)
    0
    (string->number (vector-ref (current-command-line-arguments) 0))))

(define t0 (current-inexact-milliseconds))
(define f  (fib n))
(define t1 (current-inexact-milliseconds))
(define d  (/ (- t1 t0) 1e3))

(display (format "Computed fib(~a) = ~a recursively in ~a seconds" n f d))
(newline)

