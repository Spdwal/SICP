(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))


(define (car param)
  (if (= 0 (remainder param 2))
      (+ 1 (car (/ z 2)))
      0))


(define (cdr param)
  (if (= 0 (remainder param 3))
      (+ 1 (cdr (/ param 3)))
      0))
