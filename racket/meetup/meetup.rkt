#lang racket

;; Using gregor means we have to change the test to also require gregor
;;   as well as get rid of the make-date function
(require gregor)
(provide meetup-day)

(define (meetup-day year month weekday schedule)
  (find-day (filter-by-day-name (days-in year month) weekday) schedule))

(define (days-in year month)
  (map (lambda (day) (date year month day))
       (range 1 (+ 1 (days-in-month year month)))))

; Filters a list to only contains days that are all day-name
(define (filter-by-day-name days day-name)
  (define new-days
    (make-hash (map cons '(Sunday
                           Monday
                           Tuesday
                           Wednesday
                           Thursday
                           Friday
                           Saturday)
                    (range 7))))
    (filter (lambda (day) (= (->wday day) (hash-ref new-days day-name))) days))

(define (find-day days criteria)
  (match criteria
    [ 'first  (first days)  ]
    [ 'second (second days) ]
    [ 'third  (third days)  ]
    [ 'fourth (fourth days) ]
    [ 'fifth  (fifth days)  ]
    [ 'last   (last days)   ]
    [ 'teenth (findf (lambda (day)
                       ; Finds the first member of days with the same weekday name as day
                       (member (->day day) (range 13 20))) days)]))
