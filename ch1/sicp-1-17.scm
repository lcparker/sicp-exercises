#lang sicp

;; Exercise 1.17
(define (even? x) (= (remainder x 2) 0))

(define (double x) (* 2 x))

(define (halve x) (/ x 2))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-mult (double a) (halve b)))
        (else (+ a (fast-mult a (- b 1))))))