#lang sicp

;; Exercise 1.18

(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (even? x) (= (remainder x 2) 0))

(define (mult-it a b)
  (define (it a b acc)
    (cond ((= b 0) acc)
          ((even? b) (it (double a) (halve b) acc))
          (else (it a (- b 1) (+ acc a)))))
  (it a b 0))
