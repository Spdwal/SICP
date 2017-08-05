(load "2_18.scm")

(define (same-parity first . rest)
  (define (sam-parity-iter source dist remainder-val)
    (if (null? source)
        dist
        (sam-parity-iter (cdr source)
                         (if (= (remainder (car dist) 2) remainder-val)
                             (append dist (list (car source)))
                             dist)
                         remainder-val)))
  (same-parity-iter rest (list first) (remainder first 2)))

