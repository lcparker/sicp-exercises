#lang sicp

;; Exercise 1.6

(define (new-if predicate then-clause else-clause)
  ;; This won't work as an if statement under the applicative ordering model,
  ;; because the expression (new-if pred then else) will first evaluate
  ;; the expressions pred, then, and else, and subsequently substitute the body
  ;; of new-if before recursively evaluating.
  (cond (predicate then-clause)
        (else else-clause)))

