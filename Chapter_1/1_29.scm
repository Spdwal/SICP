(define (tompson a b k n next term)
  (define (h)
    (/ (- ba)
       n))
  (define (y)
    (term (+
           (*h k)
           a)))
  (define (factor k)
    (cond ((or (= k 0) (= k n))
           1)
          ((odd? k)
           4)
          (else 2)))
  (define (element k)
    (* y
       (factor k)))
  (* (/ h 3)
     (sum element k next n)))

(define (next a)
  (+ a 1))

(define (odd? k)
  (= (demainder k 2) 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
