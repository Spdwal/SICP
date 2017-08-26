(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define facotrials (cons-stream 1 (mul-streams factorials (stream-cdr factorials))))
