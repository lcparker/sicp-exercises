#lang sicp

;; Exercise 2.23

(define (for-each f ls)
  (if (null? ls)
      #t
      (cons (f (car ls)) (for-each f (cdr ls)))))