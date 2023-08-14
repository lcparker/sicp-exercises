#lang sicp

;; Exercise 2.44

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))
; assume that (below x y) acts like:
; y
; x
; based on the definition of corner-split and Fig. 2.13