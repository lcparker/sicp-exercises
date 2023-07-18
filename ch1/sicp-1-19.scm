#lang sicp

;; Exercise 1.20

;; a = pb + r, then common divisors of b and a are same as of b and r
;; => why?

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


;; 206 = 5 * 40 + 6
;; 40 = 6 * 6 + 4
;; 6 = 1 * 4 + 2
;; 4 = 2 * 2 + 0
;; = 2

;; normal ordering:
;; (gcd 206 40)
;; (gcd 40 (remainder 206 40))
;; (gcd (remainder 206 40) (remainder 40 (remainder 206 40))
;; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;; ...
;; => 6 remainders? more? ah many more, another two recursions.
;; each step has b_recursions * 2 + a_recursions + 1
;; a_rec = b_rec, b_rec = a_rec + b_rec + 1
;; => (0 0) 206 40
;; => (0 1) 40 6
;; => (1 2) 6 4
;; => (2 4) 4 2
;; => (4 7) 2 0
;; => (7 12)
;; ==> either 11 or 19 recursions?

;; applicative
;; (gcd 206 40)
;; (gcd 40 (remainder 206 40)) | 1
;; (gcd 40 6)
;; (gcd 6 (remainder 40 6))
;; (gcd 6 4) | 2
;; (gcd 4 (gcd 6 4))
;; (gcd 4 2) | 3
;; (gcd 2 (gcd 4 2))
;; (gcd 2 0) | 4
;; 2

;; So normal ordering will have dozens, applicative will have 4