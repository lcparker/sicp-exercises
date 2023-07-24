#lang sicp

;; Exercise 2.4

(define (cons x y) (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))

;; (car (cons x y))
;; => (car (lambda (m) (m x y)))
;; => ((lambda (m) (m x y)) (lambda (p q) p))
;; => ((lambda (p q) p) x y)
;; => x


;; corresponding definition of cdr z
(define (cdr z)
  (z (lambda (p q) q)))
;; (car (cons x y))
;; => (car (lambda (m) (m x y)))
;; => ((lambda (m) (m x y)) (lambda (p q) q))
;; => ((lambda (p q) q) x y)
;; => y