#lang sicp

;; Exercise 1.26

;; *If* you assume that scheme evaluates expressions in a naive way, then
;; (* expr expr) evaluate expr twice, before computing the product. So even
;; though you're halving the number of unique exponentials you have to compute,
;; you're computing each exponential twice rather than just once.
;; 
;; Square doesn't have this problem, because the argument is evaluated once.
;;
;; This seems like it could be solved with a reasonably clever interpreter
;; (for example, by caching expressions) though which is confusing.