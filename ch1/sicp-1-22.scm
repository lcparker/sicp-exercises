#lang sicp

;; Exercise 1.22

(define (timed-prime-test n) (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime start elapsed-time)
  (display " *** ")
  (display start)
  (display " ")
  (display elapsed-time)
  (newline))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1))))) (define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n) (find-divisor n 2))

(define (square x) (* x x))

(define (search-for-primes start end start-time)
  (if (= (remainder start 2) 1)
      (if (prime? start)
          (report-prime start (- (runtime) start-time))))
  (if (< start end)
      (search-for-primes (+ start 1) end start-time)))

(define (find-primes start-prime end-prime)
  (search-for-primes start-prime end-prime (runtime)))