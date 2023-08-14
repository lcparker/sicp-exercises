#lang sicp

;; Exercise 2.46

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect p q)
  (make-vect
   (+ (xcor-vect p) (xcor-vect q))
   (+ (ycor-vect p) (ycor-vect q))))
(define (scale-vect s p)
  (make-vect (* s (xcor-vect p)) (* s (ycor-vect p))))

(define (sub-vect p q)
  (add-vect p (scale-vect -1 q)))

(define p (make-vect 1 2))
(define q (make-vect 4 3))
(define s -3)

(add-vect p q)
(scale-vect s p)
(sub-vect p q)