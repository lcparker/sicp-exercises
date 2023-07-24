#lang sicp

;; Exercise 2.3

(define (make-segment start-segment end-segment) (cons start-segment end-segment))
(define (start-segment line-segment) (car line-segment))
(define (end-segment line-segment) (cdr line-segment))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))
(define (average-points p q)
  (make-point (/ (+ (x-point p) (x-point q)) 2)
              (/ (+ (y-point p) (y-point q)) 2)))
(define (subtract-points p q)
  (make-point (- (x-point p) (x-point q))
              (- (y-point p) (y-point q))))

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
;; Representation 1
(define (make-rect top-left bottom-right)
  (cons top-left bottom-right))
(define (top-left rect) (car rect))
(define (bot-right rect) (cdr rect))

;; Representation 2
(define (make-rect-2 origin x-length y-length)
  (cons origin (cons x-length y-length)))
(define (side-lengths-2 rect)
  (make-point (car (cdr rect)) (cdr (cdr rect))))

(define (area rect)
  (let ((side-lengths (subtract-points (bot-right rect) (top-left rect))))
    (* (x-point side-lengths) (y-point side-lengths))))

(define (perimeter rect)
  (let ((side-lengths (subtract-points (bot-right rect) (top-left rect))))
    (+ (* 2 (x-point side-lengths)) (* 2 (y-point side-lengths)))))
    