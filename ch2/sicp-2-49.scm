#lang sicp

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
               (scale-vect (ycor-vect v) (edge2-frame frame))))))

(define (make-segment v1 v2)
  (cons v1 v2))

(define (start-segment s)
  (car v))

(define (end-segment s)
  (cdr v))

;; Exercsie 2.49

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame)
         (start-segment segment))
        ((frame-coord-map frame)
         (end-segment segment))))
     segment-list)))


; a.
(segments->painter
 (list
  (make-segment (origin-frame f) (edge1-frame f))
  (make-segment (edge1-frame f) (add-vect (edge1-frame f) (edge2-frame f)))
  (make-segment (add-vect (edge1-frame f) (edge2-frame f)) (edge2-frame f))
  (make-segment (edg2-frame f) (origin-frame f))))

; b.
(segments->painter
 (list
  (make-segment (origin-frame f) (add-vect (edge1-frame f) (edge2-frame f)))
  (make-segment (edge1-frame f) (edge2-frame f))))

; c.
(define ll (origin-frame f))
(define lr (edge2-frame f))
(define tl (edge1-frame f))
(define tr (add-vect (edge1-frame f) (edge2-frame f)))

(define ml (scale-vect 0.5 (add-vect ll tl)))
(define mb (scale-vect 0.5 (add-vect ll lr)))
(define mt (scale-vect 0.5 (add-vect tl tr)))
(define mr (scale-vect 0.5 (add-vect tr lr)))

(segments->painter
 (list
  (make-segment ml mt)
  (make-segment mt mr)
  (make-segment mr mb)
  (make-segment mb ml)))

; d.
; nope
  