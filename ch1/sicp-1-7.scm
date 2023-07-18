#lang sicp

;; Exerxise 1.7

(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (improve guess x) (average guess (/ x guess)))

;; absolute error implementation (sicp)

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x) (if (good-enough? guess x)
                                guess
                                (sqrt-iter (improve guess x) x)))
      
(define (sqrt x) (sqrt-iter 1.0 x))

;; relative error implementation (mine)

(define (good-enough-relative? this-guess prev-guess)
  (< (abs (/ (- this-guess prev-guess) prev-guess)) 0.01))

(define (sqrt-iter-relative guess prev-guess x)
  (if (good-enough-relative? guess prev-guess)
      guess
      (sqrt-iter-relative (improve guess x) guess x)))

(define (sqrt-relative x)
  (sqrt-iter-relative 1.0 2.0 x))

;; testing

(define (sqrt-error f x)
  (- (* (f x) (f x)) x))

(define (sqrt-compare x)
  (begin
    (display x)
    (display ", absolute error: ")
    (display (sqrt x))
    (display " ")
    (display (sqrt-error sqrt x))
    (newline)
    (display x)
    (display ", relative error: ")
    (display (sqrt-relative x))
    (display " ")
    (display (sqrt-error sqrt-relative x))
    (newline)))

(sqrt-compare 4) ;; both are good for small numbers

(sqrt-compare 0.0001) ;; relative is better for small numbers

(sqrt-compare 1000000) ;; absolute is better for large numbers

