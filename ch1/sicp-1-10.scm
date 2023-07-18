#lang sicp

;; Exercise 1.10

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))


;; => ( A 0 10) add 2 10 times => 2*n
;; => (A 1 10) mult. 2 10 times => 2 * 2 * 2 ... * 2
;; => (A 2 10) expt. 2 10 times => 2 ^ 2 ^ 2

;; wtf?
