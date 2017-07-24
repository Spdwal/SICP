(define (square x)
  (* x x))

(define (expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n)
         (expt-iter (square b) (/ n 2) a))
        ((odd? n)
         (expt-iter b (- n 1) (* b a))
            )))

(define (expt2 b n)
  (expt-iter b n 1))

(define (even? n)
  (= (remainder n 2) 0))

(define (odd? n)
  (not (even? n)))
