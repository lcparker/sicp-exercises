#lang sicp

;; Exercise 1.4

(define (a-plus-abs-b a b)
  ;; evaluates a + b if b is positive or a - b if b is negative,
  ;; so that the function executes a + |b|
  ((if (> b 0) + -) a b))

