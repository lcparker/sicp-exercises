#lang sicp

;; Exercise 2.21

(define (square-list-iter items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list-iter (cdr items)))))

(define (square-list-map items)
  (map (lambda (x) (square x)) items))

(define (square x) (* x x))

;; > (square-list-map (list 1 2 3 4))
;; (1 4 9 16)
;; > (square-list-iter (list 1  2 3 4))
;; (1 4 9 16)