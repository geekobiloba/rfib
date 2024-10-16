;;
;; Recursive Fibonacci in Gambit Scheme
;;

(import (srfi 28)) ; format ; compile with -exe -preload

(define (fib n)
  (if (< n 2)
    n
    (+ (fib (- n 1)) (fib (- n 2)))))

(define n
  (if (equal? (command-args) '())
    0
    (string->number (car (command-args)))))

(define t0 (current-second))
(define f  (fib n))
(define t1 (current-second))
(define d  (- t1 t0))

(display (format "Computed fib(~a) = ~a recursively in ~a seconds" n f d))
(newline)

