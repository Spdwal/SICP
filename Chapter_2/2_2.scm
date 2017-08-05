(define (make-point x y)
  (cons x y))

(define (make-segment begin end)
  (cons begin end))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (average a b)
  (/  (+ a b) 2))

(define (midpoint-segment seg)
  (make-point (average (x-point (start-segment seg))
                       (y-point (end-segment seg)))
              (average (y-point (start-setment seg))
                       (y-point (end-segment seg)))))


(define (print-point p)
  (newline)
  (display "()")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

