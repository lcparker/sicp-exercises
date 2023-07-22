#lang sicp

;; Exercise 1.27

;; Charmichael numbers

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m)) (else
               (remainder
                (* base (expmod base (- exp 1) m))
                m))))

(define (square x) (* x x))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

;; want to show that a^n mod n for each a from 1 to n-1 is a


(define (fermat-test-comprehensive n)
  (define (test a)
    (if (= a 1)
        #t
        (and (= (expmod a n n) a) (test (- a 1)))))
  (test (- n 1)))

(fermat-test-comprehensive 561)
(fermat-test-comprehensive 1105)
(fermat-test-comprehensive 1729)
(fermat-test-comprehensive 2465)
(fermat-test-comprehensive 2821)
(fermat-test-comprehensive 6601)