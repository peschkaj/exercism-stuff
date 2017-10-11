#lang racket

(provide to-rna)

(define (to-rna dna)
  (list->string (for/list ([x dna])
                  (transcribe x))))

(define (transcribe x)
  (cond [(equal? x #\G) #\C]
        [(equal? x #\C) #\G]
        [(equal? x #\T) #\A]
        [(equal? x #\A) #\U]
        [exn:fail]))
