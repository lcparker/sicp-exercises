#lang sicp

;; Exercise 2.29

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; a.
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

;; need to take cadr because otherwise the answer will be a nested list
(define (branch-structure branch)
  (cadr branch))

;; b.
(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else
         (+ (total-weight
             (branch-structure (left-branch mobile)))
            (total-weight
             (branch-structure (right-branch mobile)))))))

(define m
  (make-mobile
   (make-branch
    1
    (make-mobile
     (make-branch 1 1)
     (make-branch 2 2)))
   (make-branch 1 3)))

(total-weight m)

;; c.

;; test whether a binary mobile is balanced
(define (is-balanced? mobile)
  (cond ((not (pair? mobile)) #t)
        (else 
         (let ((left (left-branch mobile))
               (right (right-branch mobile)))
           (and
            (= (torque left) (torque right))
            (is-balanced? (branch-structure left))
            (is-balanced? (branch-structure right)))))))

(define (torque branch)
  (let ((length (branch-length branch))
        (weight (total-weight (branch-structure branch))))
    (* length weight)))

(is-balanced? m)

(define bal
  (make-mobile
   (make-branch 2
                (make-mobile
                 (make-branch 1 2)
                 (make-branch 2 1)))
   (make-branch 1 6)))

(is-balanced? bal)

;; d.
;; if you redefine the constructors as
(define (make-mobile-2 left right)
  (cons left right))

(define (make-branch-2 length structure)
  (cons length structure))

;; all you need to do to update the program is to update the selectors for
;; right-branch and branch-structure to call cdr instead of cadr. that's the
;; advantage of setting up good layers of abstraction