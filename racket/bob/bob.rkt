#lang racket

(require racket/string)

(provide response-for)

(define (response-for w)
  (let* ([words (string-trim w)])
    (cond [(silence? words) "Fine. Be that way!"]
          [(shout? words) "Whoa, chill out!"]
          [(question? words) "Sure."]
          [else "Whatever."])))

(define (silence? s)
  (not (non-empty-string? s)))

(define (shout? shout)
  (let* ([just-letters (strip-non-letters shout)])
    (and (non-empty-string? just-letters)
         (equal? just-letters (string-upcase just-letters)))))

(define (question? question)
  (string-suffix? question "?"))

(define (strip-non-letters w)
  (list->string (filter char-alphabetic? (string->list w))))
