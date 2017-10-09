#lang racket

(provide hamming-distance)

(define (hamming-distance upper lower)
  (if (not (equal? (string-length upper)
                   (string-length lower))) (exn:fail)
      (for/sum ([a upper]
                [b lower]
                #:when (not (equal? a b)))
        1)))
