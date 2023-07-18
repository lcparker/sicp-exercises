#lang sicp

;; Exercise 1.15

(define (cube x) (* x x x))

(define (p x)
  (- (* 3 x) (* 4 (cube x))))

(define (sin x)
  (cond ((< x 0.1) x)
        (else (-
               (* 3 (sin (/ x 3)))
               (* 4 (cube (sin (/ x 3))))))))