;;#!/usr/bin/env sbcl --script
;;
;; Recursive Fibonacci in SBCL
;;

(load "~/quicklisp/setup.lisp")
;(ql:quickload "local-time" :silent t)
(require "local-time")

(defun fib (n)
  (if (< n 2)
    n
    (+ (fib (- n 1)) (fib (- n 2)))))

(defun timestamp ()
  (let ((tx (local-time:now)))
  (/
    (+
      (* (local-time:timestamp-to-unix tx) 1000000)
      (local-time:timestamp-microsecond tx))
    1000000)))

(defun main ()
  (let* (
    (args sb-ext:*posix-argv*)
    (arg1 (car (cdr args)))
    (n (if (null arg1) 0 (parse-integer arg1)))

    (t0 (timestamp))
    (f  (fib n))
    (t1 (timestamp))
    (d  (- t1 t0))
  )

    (format t "Computed fib(~A) = ~A recursively in ~f seconds~%" n f d)
  ))

(eval-when (:load-toplevel :compile-toplevel :execute) (main))

