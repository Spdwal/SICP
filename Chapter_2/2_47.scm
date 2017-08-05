(define (make-frame origin edge1 edge2)
  (list orgin edge1 edge2))
(define (frame-orgin f) (car f))
(define (frame-edge1 f) (cadr f))
(define (frame-edge2 f) (caddr f))


(define (make-frame orgin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (frame-orgin f) (car f))

(define (frame-edge1 f) (cadr f))

(define (frame-edge2 f) (cddr f))
