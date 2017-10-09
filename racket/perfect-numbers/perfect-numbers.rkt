#lang racket

(require math/number-theory)
(require math/base)

(provide perfect-numbers)

(define (perfect-numbers n)
  (for/list ([i (range 1 (add1 n))]
             #:when (perfect? i))
    i))

(define (perfect? n)
  (equal? n
          (sum (factors n))))

(define (factors n)
  (remove n (divisors n)))
