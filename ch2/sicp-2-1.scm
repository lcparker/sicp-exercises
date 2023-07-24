#lang sicp

;; Exercise 2.1

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (neg x) (* -1 x))

(define (sign x)
  (if (< x 0) x (neg x)))

(define (abs x) (if (< x 0) (neg x) x))

(define (make-rat n d)
  (let (
        (n-pos (abs n))
        (d-pos (abs d))
        (g (gcd (abs n) (abs d)))
        )
    (if (> (* n d) 0)
        (cons (/ n-pos g) (/ d-pos g))
        (cons (/ (neg n-pos) g) (/ d-pos g)))))



(make-rat 1 4)
(make-rat 1 -4)
(make-rat -1 4)
(make-rat -1 -4)