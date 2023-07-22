#lang sicp

;; Exercise 1.25

;; One reason this might not work well is that the primes you want to test can
;; be very big, and exponentiating a big number will send you outside of the
;; range of numbers that can be represented in b bytes for some fixed b. Taking
;; the modulus at each step solves this problem. Even if you did try to use an
;; arbitrary-length representation, you'd find your space constraints explode
;; as you increase the prime size.
