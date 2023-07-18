#lang sicp

;; Exercise 1.3

(define (sum-squares a b)
  (+ (* a a) (* b b)))

(define (ssq-largest-two a b c)
  (cond
    ((and (> a c) (> b c)) (sum-squares a b))
    ((and (> a b) (> c b)) (sum-squares a c))
    ((and (> b a) (> c a)) (sum-squares b c))))

