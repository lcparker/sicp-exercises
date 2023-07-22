#lang sicp

;; Exercise 1.23

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b) (= (remainder b a) 0))


(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x) (* x x))


;; my code

(define (next n)
  (cond ((= 2 n) 3)
        (else (+ n 1))))


(define (time-primes)
  (define t0 (runtime))
  (smallest-divisor 10007)
  (smallest-divisor 10009)
  (smallest-divisor 10037)
  (smallest-divisor 10039)
  (smallest-divisor 10061)
  (smallest-divisor 10067)
  (smallest-divisor 10069)
  (smallest-divisor 10079)
  (smallest-divisor 10091)
  (smallest-divisor 10009981)
  (smallest-divisor 109841)
  (display (- (runtime) t0)))

(time-primes)

;; with incrementing by 1 -- 180ms
;; with incremeneting by 2 -- 114ms

;; BUT -- if you change the (+ n 2) in next to (+ n 1), runtime is ~240ms,
;; which *is* double, so the overhead is due to function calls and conds