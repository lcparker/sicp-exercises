#lang sicp

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame
                  new-origin
                  (sub-vect (m corner1) new-origin)
                  (sub-vect (m corner2) new-origin)))))))


;; Exercise 2.50

(define (flip-horiz painter)
  (lambda (frame)
    (transform-painter
     (make-vect 1.0 0.0)
     (make-vect 0.0 0)
     (make-vect 1.0 1.0))))

(define (rotate-180 painter)
  (lambda (frame)
    (transform-painter
     (make-vect 1.0 1.0)
     (make-vect 0.0 1.0)
     (make-vect 1.0 0.0))))


(define (rotate-270 painter)
  (lambda (frame)
    (transform-painter
     (make-vect 0.0 1.0)
     (make-vect 0.0 0.0)
     (make-vect 1.0 1.0))))

