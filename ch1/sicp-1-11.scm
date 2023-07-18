#lang sicp

;; Exercise 1.11

(define (f-recursive n)
  (cond ((< n 3) n)
        (else (+ (f-recursive (- n 1)) (* 2 (f-recursive (- n 2))) (* 3 (f-recursive (- n 3)))))))


;; start from 0, count upwards, track this, last, second-last
;; n is last + 2 * second-last + 3 * third-last
;; while count < n
;; last = last = 2*second-last + 3 * third-last
;; second-last = last
;; third-last = second-last

(define (f-iter n count prev second-prev third-prev)
  (cond
    ((> count n) prev)
    ((< n 3) n)
    (else
     (f-iter n (+ count 1) (+ prev (* 2 second-prev) (* 3 third-prev)) prev second-prev))))

(define (f-iterative n)
  (cond ((< n 3) n)
        (else (f-iter n 3 2 1 0))))