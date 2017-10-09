#lang racket

(provide sum-of-squares square-of-sums difference)

(define (sum-of-squares n)
  (foldl +
         0
         (map square (range 1 (add1 n)))))

(define (square-of-sums n)
  (square (foldl +
                 0
                 (range 1 (add1 n)))))

(define (difference n)
  (- (square-of-sums n)
     (sum-of-squares n)))

(define (square n)
  (* n n ))
