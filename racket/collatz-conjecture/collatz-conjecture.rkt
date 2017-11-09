#lang racket

(provide collatz)

(define (collatz number)
  (cond [(not (exact? number)) (exn:fail)]
        [(< number 1) (exn:fail)]
        [(collatz-iter 0 number)]))

(define (collatz-iter acc number)
  (cond [(even? number) (collatz-iter (+ acc 1) (/ number 2))]
        [(equal? number 1) acc]
        [(collatz-iter (+ acc 1) (+ 1 (* 3 number)))]))
