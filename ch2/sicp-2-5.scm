#lang sicp

;; Exercise 2.5

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (car z)
  (define (car-iter z count-twos)
    (if (not (= (remainder z 2) 0))
        count-twos
        (car-iter (/ z 2) (+ count-twos 1))))
  (car-iter z 0))

(define (cdr z)
  (define (cdr-iter z count-threes)
    (if (not (= (remainder z 3) 0))
        count-threes
        (cdr-iter (/ z 3) (+ count-threes 1))))
  (cdr-iter z 0))

(car (cons 3 5))
(cdr (cons 3 5))