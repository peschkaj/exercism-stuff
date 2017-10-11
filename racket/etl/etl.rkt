#lang racket

(provide etl)

(define/contract (etl mapping)
  (-> (hash/c positive? (listof string?)) hash?)
  (for*/hash ([(key vs) (in-hash mapping)]
              [value vs])
    (values (string-downcase value) key)))
