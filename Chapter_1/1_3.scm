(define (bigger x y)
  (if (> x y)
      x
      y))

(define (smaller x y)
  (if (< x y)
      x
      y))

(define (another-bigger x y z)
  (bigger (smaller x y) z))

(define (sum-of-two-bigget-in-three x y z)
  (+ (bigger x y) (another-bigger x y z)))
