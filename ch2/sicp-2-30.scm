#lang sicp

;; Exercise 2.30

(define (square x) (* x x))

(define (square-tree-direct tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree-direct (car tree))
                    (square-tree-direct (cdr tree))))))

(define t (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))

(square-tree-direct t)


(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-tree-higher-order tree)
  (map (lambda (t) (if (pair? t) (square-tree-higher-order t) (square t)))
       tree))

(square-tree-higher-order t)