#lang sicp

;; Exercise 1.31

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; sum = 0
; while a:
;   sum += term(a)
;   a = next(a)

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (define (next n) (+ n 1))
  (define (id x) x)
  (product id 1 next n))



(product (lambda (x) (* x x)) 1 (lambda (n) (+ n 1)) 5)