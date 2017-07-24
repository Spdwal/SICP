(define (double a)
  (+ a a))

(define (half a)
  (/ a 2))

(define (even? a)
  (remainder a 2))

(define (odd? a)
  (not (even? a)))


(define (multi a b)
  (multi-iter a b 0))


(define (multi-iter a b product)
  (cond ((= b 0) product)
        ((even? b) (multi-iter (double a) (half b) product))
        ((odd? b) (multi-iter a (- b 1) (+ a product)))))
