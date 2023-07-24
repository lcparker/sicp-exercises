#lang sicp

;; Exercise 2.6

(define zero (lambda (f) (lambda (x) x)))
;; zero is the function f-> (x->x)

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(add-1 zero)
(add-1 (lambda (f) (lambda (x) x)))
(lambda (f) (lambda (x) (f ((zero f) x))))
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
(lambda (f) (lambda (x) (f (((lambda (x) x) x)))))
(lambda (f) (lambda (x) (f x)))
(define one (lambda (f) (lambda (x) (f x))))

;; (add-1 one)
(add-1 (lambda (f) (lambda (x) (f x))))
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

;; in general:
;; +1: f -> f( (n f) x)
;; or, n: f-> f^n(x)

