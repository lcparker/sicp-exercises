#lang sicp

;; Exercise 2.39

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest) result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse-left sequence)
  (fold-left (lambda (x y) (append (list y) x)) nil sequence))

(define s (list 1 2 3 4))

(reverse-right s)
(reverse-left s)