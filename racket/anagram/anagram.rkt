#lang racket

(provide anagrams-for)

(define (anagrams-for word candidates)
  (for/list ([candidate candidates]
             #:when (anagram? word candidate))
    candidate))

(define (sort-string s)
  (list->string (sort (string->list s) char-ci<?)))

(define (anagram? word candidate)
  (and (= (string-length word)
          (string-length candidate))
       (not (string=? word candidate))
       (string-ci=? (sort-string word)
                    (sort-string candidate))))
