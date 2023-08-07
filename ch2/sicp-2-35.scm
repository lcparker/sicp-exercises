#lang sicp

;; Exercise 2.35

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

;; putting a map in here seems dumb? the point of accumulate is it iterates over
;; a sequence, putting all of the logic into recursion in the map makes no sense
(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))

(define t (list (list 1 2) (list 3 4 5)))

(count-leaves t)