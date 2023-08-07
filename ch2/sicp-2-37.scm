#lang sicp

;; Exercise 2.37

(define m
  (list
   (list 1 2 3 4)
   (list 4 5 6 6)
   (list 6 7 8 9)))

(define v (list 1 2 3 4))

(define w (list  4 3 2 1))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (s) (car s)) seqs))
            (accumulate-n op init (map (lambda (s) (cdr s)) seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(dot-product v w)

(define (matrix-*-vector m v)
  (map (lambda (m-j) (dot-product v m-j)) m))
(matrix-*-vector m v)

(define (transpose mat)
  (accumulate-n cons nil mat))
(transpose m)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m-j) (matrix-*-vector cols m-j)) m)))

(define n (transpose m))
(matrix-*-matrix m n)