#lang sicp

;; Exercise 1.5

;; Under applicative ordering:
;; (test 0 (p)) => (test 0 (p)) => (test 0 (p)) => ...
;; So the program will run in an infinite loop, as (p) evaluates to itself.
;;
;; Under normal ordering:
;; (test 0 (p)) => (if (= 0 0) 0 (p)) => (if #t 0 (p)) => 0, I think.

