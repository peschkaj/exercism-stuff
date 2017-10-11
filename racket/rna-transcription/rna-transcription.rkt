#lang racket

(provide to-rna)

(define (to-rna rna)
  (list->string (map transcribe (string->list rna))))

(define (transcribe x)
  (cond [(equal? x #\G) #\C]
        [(equal? x #\C) #\G]
        [(equal? x #\T) #\A]
        [(equal? x #\A) #\U]
        [exn:fail]))
