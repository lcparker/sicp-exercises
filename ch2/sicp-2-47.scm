#lang sicp

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

;; Exercise 2.47

; list version
(define (make-frame-list origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame-list frame-list)
  (car frame-list))

(define (edge1-frame-list frame-list)
  (cadr frame-list))

(define (edge2-frame-list frame-list)
  (caddr frame-list))

(define p (make-frame-list
           (make-vect 0 0)
           (make-vect 0 1)
           (make-vect 1 0)))

(origin-frame-list p)
(edge1-frame-list p)
(edge2-frame-list p)


; cons version

(define (make-frame-cons origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame-cons frame-list)
  (car frame-list))

(define (edge1-frame-cons frame-list)
  (cadr frame-list))

(define (edge2-frame-cons frame-list)
  (cddr frame-list))

(define q (make-frame-cons
           (make-vect 0 0)
           (make-vect 0 1)
           (make-vect 1 0)))
(newline)
(origin-frame-cons q)
(edge1-frame-cons q)
(edge2-frame-cons q)