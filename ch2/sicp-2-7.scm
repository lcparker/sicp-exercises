#lang sicp

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))

;; Exercise 2.7

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

;; Exercise 2.8

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

;; Exercise 2.9

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

;; addition width is sum of the two widths:
;; (width (add-interval x y)
;;       (make-interval (+ (lower-bound x) (lower-bound y))
;;                 (+ (upper-bound x) (upper-bound y))))
;;=> (/ (+ (+ (lower-bound x) (lower-bound y)))
;;         (+ (upper-bound x) (upper-bound y)) 2)
;;=> (/ (+ (lower-bound x) (lower-bound y) (upper-bound x) (upper-bound y)) 2)
;;=> (+ (/ (+ (lower-bound x) (upper-bound x)) 2)
;;      (/ (+ (lower-bound y) (upper-bound y)) 2))
;;=> (+ (width x) (width y))


;; width of the product is not the sum of the widths of the operands
(define r1 (make-interval 0.9 1.1))
(define r2 (make-interval 1.9 2.1))

(width (mul-interval r1 r2))
(+ (width r1) (width r2))

;; Exercise 2.10

(define (div-interval-zero-adjusted x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (error "Cannot divide by an interval containing zero")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

;; (div-interval-zero-adjusted (make-interval 1.0 1.1) (make-interval 0.5 0.6))
;; (div-interval-zero-adjusted (make-interval 1.0 1.2) (make-interval -0.5 0.5))

;; Exercise 2.11
(define (mul-interval-2-11 a b)
  (cond ((and (> (lower-bound a) 0) (> (upper-bound a) 0))
         (cond
           ((and (> (lower-bound b) 0) (> (upper-bound b) 0))
            (make-interval
             (* (lower-bound a) (lower-bound b))
             (* (upper-bound a) (upper-bound b))))
           ((and (< (lower-bound b) 0 ) (< (upper-bound b) 0))
            (make-interval
             (* (upper-bound a) (lower-bound b))
             (* (lower-bound a) (upper-bound b))))
           ((and (< (lower-bound b) 0) (> (upper-bound b) 0))
            (make-interval
             (* (upper-bound a) (lower-bound b))
             (* (upper-bound a) (upper-bound b)))))
         ((and (< (lower-bound a) 0) (< (upper-bound a) 0))
          (cond
            ((and (> (lower-bound b) 0) (> (upper-bound b) 0))
             (make-interval
              (* (lower-bound a) (upper-bound b))
              (* (upper-bound a) (lower-bound b))))
            ((and (< (lower-bound b) 0 ) (< (upper-bound b) 0))
             (make-interval
              (* (upper-bound a) (upper-bound b))
              (* (lower-bound a) (lower-bound b))))
            ((and (< (lower-bound b) 0) (> (upper-bound b) 0))
             (make-interval
              (* (lower-bound a) (upper-bound b))
              (* (lower-bound a) (lower-bound b))))))
         ((and (< (lower-bound a) 0) (> (upper-bound a) 0))
          (cond
            ((and (> (lower-bound b) 0) (> (upper-bound b) 0))
             (make-interval
              (* (lower-bound a) (upper-bound b))
              (* (upper-bound a) (upper-bound b))))
            ((and (< (lower-bound b) 0 ) (< (upper-bound b) 0))
             (make-interval
              (* (upper-bound a) (lower-bound b))
              (* (upper-bound a) (upper-bound b))))
            ((and (< (lower-bound b) 0) (> (upper-bound b) 0))
             (make-interval
              (min
               (* (lower-bound a) (upper-bound b))
               (* (upper-bound a) (lower-bound b)))
              (max
               (* (lower-bound a) (lower-bound b))
               (* (upper-bound a) (upper-bound b))))))))))
         
;; Exercise 2.12
(define (make-center-width c w) (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width-sicp i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent center percent)
  (make-center-width center (/ (* center percent) 2)))

(define (percent i)
  (/ (width-sicp i) (center i)))

;; Exercise 2.13
;; skipping

;; Exercise 2.14
(define (par1 r1 r2)
  (div-interval
   (mul-interval r1 r2)
   (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval
          (div-interval one r1)
          (div-interval one r2)))))

(define p1 (make-interval 0.95 1.05))
(define p2 (make-interval 1.95 2.05))

;; every operation compounds the error, so the bounds will not be the same
(+ (percent p1) (percent p2));; 0.75
(percent (div-interval p1 p2)) ;; 0.749

;; Exercise 2.15
;; Yeah, she's right -- error compounds with each operation, so you want to
;; use the minimal number of operations to get your answer.

;; Exercise 2.16
;; Equivalent *algebraic* expressions will never lead to different answers,
;; which is what make it algebra. *However*, we don't have all the algebraic
;; axioms when we do interval arithmetic -- in particular we don't have
;; inverses under addition or multiplication. So our system is not sufficiently
;; powerful. You might be able to reduce all equivalent algebraic expressions
;; to their most minimal form, but I suspect this is in general a hard problem.