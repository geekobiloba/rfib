;;
;; Recursive Fibonacci in Gerbil Scheme
;;

(import :std/format)
(export main)

(define (fib n)
  (if (< n 2)
    n
    (+ (fib (- n 1)) (fib (- n 2)))))

(define (main . args)
  (define n
    (if (equal? (command-args) '())
      0
      (string->number (car (command-args)))))

  (define t0 (current-second))
  (define f  (fib n))
  (define t1 (current-second))
  (define d  (- t1 t0))

  (printf "Computed fib(~A) = ~A recursively in ~F seconds~%" n f d)
)

