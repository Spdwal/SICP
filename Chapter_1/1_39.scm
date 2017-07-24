(define (tan-cf x k)
  (define (cf i)
    (if (= i k)
        (/ (square x)
           (- (* 2 i) 1))
        (/ (square x)
           (- (- (* 2 i) 1) (cf (+ i 1))))))
  (cf 1))


