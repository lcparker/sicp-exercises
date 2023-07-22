#lang sicp

;; Exercise 1.24

;; There's no need to use the whole timed-prime-test procedure if all we want
;; to know is the growth characteristic of `fast-prime?`

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1))) (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

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

;; use search-for-primes-fast 

(define (report-prime prime elapsed-time)
  (display " *** ")
  (display prime)
  (display ", ")
  (display elapsed-time)
  (newline))

(define (test-prime n)
  (define t0 (runtime))
  (fast-prime? n 1000)
  (define t1 (runtime))
  (report-prime n (- t1 t0)))

;; (test-prime 1741)
;; (test-prime 1000037)

;; for primes ~10^3
(test-prime 1009)
(test-prime 1013)
(test-prime 1019)
(test-prime 1021)
(test-prime 1031)
(test-prime 1033)
(test-prime 1039)
(test-prime 1051)
(test-prime 1049)
(test-prime 1061)
;; ~700ms each, removing outliers (some take 4x longer, I assume from multitasking)

;; for primes ~10^6
(test-prime 1000003)
(test-prime 1000033)
(test-prime 1000037)
(test-prime 1000039)
(test-prime 1000081)
(test-prime 1000099)
(test-prime 1000117)
(test-prime 1000121)
(test-prime 1000133)
(test-prime 1000151)
;; ~1800ms each, no outliers. So more than twice the time... weird? Not sure why?
