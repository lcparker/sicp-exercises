#lang sicp

;; from sicp
(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n) (find-divisor n 2))

(define (square x) (* x x))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

;; Exercise 2.40

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(unique-pairs 4)

;; simplify definition:

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(prime-sum-pairs 4)

;; Exercise 2.41

(define (unique-triplets n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(unique-triplets 4)

(define (sum-ordered-triplets sum n)
  (filter (lambda (t) (= (accumulate + 0 t) sum))
          (unique-triplets n)))

(sum-ordered-triplets 10 5)

;; Exercise 2.42

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

;; queen-cols returns seq of all ways to place queens in the first k cols of the board
;; represent a set of queen placements as (q_k q_{k-1} q_{k-2} q_{k-3} ... q_1), where q_i is
;; what row the queen in the ith column is placed. that way you compare (car s) to (cdr s) to
;; check if the kth queen conflicts with any of the earlier queens
;; then empty-board is (),

(define empty-board nil)

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define (safe? k positions)
  (and (not-same-row? (car positions) (cdr positions))
       (not-same-diag? 1 (car positions) (cdr positions))))

(define (not-same-row? new-pos positions)
  (cond ((null? positions) #t)
        ((null? (car positions)) #t)
        (else (and
               (not (= new-pos (car positions)))
               (not-same-row? new-pos (cdr positions))))))

(define (not-same-diag? row-diff new-col positions)
  (cond ((null? positions) #t)
        ((null? (car positions)) #t)
        (else (and (not (= (- new-col row-diff) (car positions)))
                   (not (= (+ new-col row-diff) (car positions)))
                   (not-same-diag? (+ row-diff 1) new-col (cdr positions))))))
(newline)
(display "Queens")
(newline)
(queens 6)

;; Exercise 2.43

;; louis' algo calculates (queen-cols (- k 1)) n times for each recursion layer.
;; not sure how to estimate the time taken to solve the program since it depends
;; on how long (queen-cols (- k i)) is for each i. If you assume they're always
;; a constant length you get L * (n*n*...*n n times = n^n) whereas the implementation from 2.42 would
;; just take time L. So it's 8^8 times slower.