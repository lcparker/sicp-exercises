#lang sicp

;; Exercise 1.16 -- invariant states

(define (expt-iterative x n)
  (cond ((= n 1) x)
        ((= (remainder n 2) 0) (expt-iterative (* x x) (/ n 2)))
        ((= (remainder n 2) 1) (* x (expt-iterative x (- n 1))))))