#lang sicp

;; Exercise 1.29

(define (cube x) (* x x x))

; ls = ['r', 'g' , 'b']; for x in ls
; for (int i=0; i<n; i++)

(define (simpson f a b n)
  ; n.b. this should probably use sum but not sure it's cleaner?
  (define h (/ (- b a) n))
  (define (simpson-accumulator k acc)
    (define mult
      (cond ((or (= k 0) (= k n)) 1)
            ((= (remainder k 2) 0) 2)
            ((= (remainder k 2) 1) 4)))
    (cond ((= n k) (+ acc (f (+ a (* h k)))))
          (else (simpson-accumulator (+ k 1) (+ acc (* mult (f (+ a (* h k)))))))))
  (* (/ h 3) (simpson-accumulator 0 0)))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 (/ 1 100))
(integral cube 0 1 (/ 1 1000))