(define (make-center-percent c w)
  (make-interval (* c (+ 1 (/ w 100)))
                 (* c (- 1 (/ w 100)))))

