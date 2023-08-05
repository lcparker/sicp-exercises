#lang sicp

;; Exercise 2.27
           
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (deep-reverse l)
  (cond ((not (pair? l)) l)
        ((pair? (car l)) (append (deep-reverse (cdr l)) (list (deep-reverse (car l)))))
        (else (append (deep-reverse (cdr l)) (list (car l))))))

(define ls (list 1 2 (list 3 4) (list 5 6)))
(deep-reverse ls)