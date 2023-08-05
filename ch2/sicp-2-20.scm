#lang sicp

;; Exercise 2.20

(define (same-parity-two x y) (= (remainder x 2) (remainder y 2)))

(define (same-parity x . z)
  (cons x (filter (lambda (val) (same-parity-two x val)) z)))

(define (filter f l)
  (cond ((null? l) l)
        ((f (car l)) (cons (car l) (filter f (cdr l))))
        (else (filter f (cdr l)))))

(same-parity 1 2 3 4 5 6)