#lang sicp

;; Exercise 2.45

(define (split first second)
  ; returns a function that applies the painter n times in the different splits
  (define (split-function painter n)
    if ((= n 0)
        painter
        (let ((smaller (split-function painter (- n 1))))
          (first painter (second smaller smaller))))))