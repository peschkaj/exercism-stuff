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

;; (define (anagrams-for word candidates)
;;   (if (contains-word? candidates word) '()
;;       (let* ([perms (remove word (permutations-of (string-downcase word)))])
;;         ;; check if perms contains any words from candidate
;;         (for/list ([c candidates]
;;                    #:when (contains-word? perms c))
;;           c))))

;; (define (permutations-of s)
;;   (map list->string (permutations (string->list s))))

;; (define (contains-word? lst word)
;;   (number? (index-of lst (string-downcase word))))
