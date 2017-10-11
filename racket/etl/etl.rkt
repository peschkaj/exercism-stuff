#lang racket

(provide etl)

(define (etl score-hash)
  (let* ([key-list (for/list ([key (hash-keys score-hash)]
                              #:when (<= key 0))
                     key)]
         [key-count (length key-list)])

    (if (> key-count 0) (exn:fail:contract)
        (for*/hash ([(score letters) score-hash]
                   [letter letters])
          (values (string-downcase letter) score)))))
