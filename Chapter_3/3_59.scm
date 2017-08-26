;;a
(define (integrate-series stream)
  (stream-map / stream integars))

;;b
(define (integers-starting-from n step)
  (cons-stream 1 (integers-starting-from (+ n step) step)))

;;(sinx)' = cosx
(define sine-series (cons-stream 0 (integrate-series cosine-series)))

;;(cosx)' = -sinx
(define cosine-series (cons-stream 1 (integrate-series (scale-stream sine-series -1))))
