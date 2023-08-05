#lang sicp

;; Exercise 2.18

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (reverse l)
  (if (null? l)
      l
      (append (reverse (cdr l)) (list (car l)))))

(reverse (list 1 2 3 4 5))