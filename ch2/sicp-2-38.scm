#lang sicp

;; Exercise 2.38

;; (fold-right / 1 (list 1 2 3))
;;  -> 3/2

;; (fold-left / 1 (list 1 2 3))
;; -> 1/6

;; (fold-right list nil (list 1 2 3))
;; (list 1 (list 2 (list nil 3))) -> (1 (2 (() 3)))

;; (fold-left list nil (list 1 2 3))
;; (list (list (list nil 1) 2) 3) -> ( ( ( () 1) 2) 3)

;; to have right and left folding be equivalent, you need op to be associative