(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (* (+ a a) (/ b 2)))
        ((odd?  b)
         (+ (* a (- b 1)))a)))

(define (even? b)
  (remainder b 2))

(define (odd? b)
  (not (even? b)))
