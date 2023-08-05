#lang sicp

;; Exercise 2.32

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (subset) (cons (car s) subset)) rest)))))

(subsets (list 1 2 3))

;; It works because, given a set S and element x not in S, then all the subsets
;; of (cons x S) will be Union(subsets of S, {x} Union s for s in subsets(S)).
;; One way to convince yourself is the following argument: Consider all subsets
;; of S'. You can split these into two groups -- subsets without x, and subsets
;; with x. The subsets without x are just all the subsets of S=S'\{x}. The subsets
;; with x in them can be written {x}Us for s being the rest of the subset. Then s
;; can only be a subset of S, and all the subsets {x}Us of S' are just
;; {{x}Us for s subset of S}. :)

;; I find it easier to convince myself just by building up subsets inductively
;; and seeing that it works.