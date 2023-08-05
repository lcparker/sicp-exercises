#lang sicp

;; Exercise 1.8

;; sicp code
(define (cube x) (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))
      
;; Newton's method for cube roots

;; If y is an approximation for cube root of x, then a better approximation is
;; given by
(define (approximate-cube-root guess radicand)
  (/ (+ (/ radicand (* guess guess)) (* 2 guess))
     3))

(define (cube-root-iter guess radicand)
  (if (good-enough? guess radicand)
      guess
      (cube-root-iter (approximate-cube-root guess radicand) radicand)))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 8)
