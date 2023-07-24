#lang sicp

;; Exercise 2.2

(define (make-segment start-segment end-segment) (cons start-segment end-segment))
(define (start-segment line-segment) (car line-segment))
(define (end-segment line-segment) (cdr line-segment))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))
(define (average-points p q)
  (make-point (/ (+ (x-point p) (x-point q)) 2)
              (/ (+ (y-point p) (y-point q)) 2)))

(define (midpoint-segment line-segment)
  (average-points (start-segment line-segment) (end-segment line-segment)))

(define (print-point p) (newline)
  (display "(") (display (x-point p)) (display ",")
  (display (y-point p))
  (display ")"))

(define p1 (make-point 2 4))
(define p2 (make-point 1 5))
(define line (make-segment p1 p2))
(print-point (midpoint-segment line))