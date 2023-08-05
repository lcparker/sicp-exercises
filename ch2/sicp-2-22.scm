#lang sicp

;; Exercise 2.22

(define (square-list items)
  (define (iter things answer)
    (if (null? things) answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

;; the above won't work because he's appending to the answer list one at a time,
;; as he's iterating through the list (element 1 is first to be added to answer,
;; element 2 second, ...)

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

;; this one won't work because you're consing a list with a scalar, instead of a
;; scalar with a list. so you'll get (cons (1 2 3) 4) => ((1 2 3) 4) which isn't
;; what you want.